import 'dart:math';
import 'package:dio/dio.dart';
import 'package:patient_app/services/token_service.dart';
import 'package:patient_app/api_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;

  AuthInterceptor(this._dio);

  // Pure Dart RFC 4122 compliant UUID v4 generator
  String _generateUUIDv4() {
    final random = Random.secure();
    final hex = List<String>.generate(
        16, (i) => random.nextInt(256).toRadixString(16).padLeft(2, '0'));

    // Set version to 4 (0100)
    final val6 = int.parse(hex[6], radix: 16);
    hex[6] = ((val6 & 0x0f) | 0x40).toRadixString(16).padLeft(2, '0');

    // Set variant to RFC 4122 (10xx)
    final val8 = int.parse(hex[8], radix: 16);
    hex[8] = ((val8 & 0x3f) | 0x80).toRadixString(16).padLeft(2, '0');

    return '${hex.sublist(0, 4).join()}-${hex.sublist(4, 6).join()}-${hex.sublist(6, 8).join()}-${hex.sublist(8, 10).join()}-${hex.sublist(10, 16).join()}';
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final path = options.path;

    // 1. Add Idempotency-Key (UUID v4) on POST requests
    if (options.method.toUpperCase() == 'POST') {
      options.headers['Idempotency-Key'] = _generateUUIDv4();
    }

    // 2. Set Authorization Header
    if (path.contains('/patient/refreshToken')) {
      final refreshToken = await TokenService.getRefreshToken();
      if (refreshToken != null) {
        options.headers['Authorization'] = 'Bearer $refreshToken';
      }
    } else {
      // List of public endpoints that don't need access token
      final isPublic = path.contains('/patient/searchLogin') ||
          path.contains('/patient/preRegister') ||
          path.contains('/patient/verifyPreRegistration') ||
          path.contains('/patient/completeRegistration') ||
          path.contains('/patient/resendOtp') ||
          path.contains('/patient/resendPhoneLoginOTP') ||
          path.contains('/patient/verifyPhoneLogin');

      if (!isPublic) {
        final accessToken = await TokenService.getAccessToken();
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
      }
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // 3. Handle Token Refresh on 401 Unauthorized
    if (err.response?.statusCode == 401) {
      final path = err.requestOptions.path;
      // Do not try to refresh if the failed request was a login, registration, or refreshToken request itself
      final isAuthEndpoint = path.contains('/patient/searchLogin') ||
          path.contains('/patient/preRegister') ||
          path.contains('/patient/verifyPreRegistration') ||
          path.contains('/patient/completeRegistration') ||
          path.contains('/patient/verifyPhoneLogin') ||
          path.contains('/patient/refreshToken');

      if (!isAuthEndpoint) {
        try {
          final refreshed = await _refreshToken();
          if (refreshed) {
            // Retry the failed request with the new access token
            final options = err.requestOptions;
            final accessToken = await TokenService.getAccessToken();
            options.headers['Authorization'] = 'Bearer $accessToken';

            final response = await _dio.fetch(options);
            return handler.resolve(response);
          }
        } catch (e) {
          // Refresh failed, clear tokens and let the error propagate
          await TokenService.clearTokens();
        }
      }
    }
    return handler.next(err);
  }

  Future<bool> _refreshToken() async {
    final refreshToken = await TokenService.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      return false;
    }

    try {
      // Create a separate Dio instance to avoid circular calls in the interceptor
      final refreshDio = Dio();
      refreshDio.options.headers['Authorization'] = 'Bearer $refreshToken';

      final response =
          await refreshDio.post('${ApiService.baseUrl}/patient/refreshToken');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data['data'];
        if (data != null &&
            data['accessToken'] != null &&
            data['refreshToken'] != null) {
          await TokenService.saveTokens(
            accessToken: data['accessToken'],
            refreshToken: data['refreshToken'],
          );
          return true;
        }
      }
    } catch (e) {
      // Failed to refresh
    }
    return false;
  }
}
