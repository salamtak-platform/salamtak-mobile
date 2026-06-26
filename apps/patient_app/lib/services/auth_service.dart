import 'package:dio/dio.dart';
import 'package:patient_app/api_service.dart';

class AuthService {
  AuthService({required this.apiService});

  final ApiService apiService;

  Future<Map<String, dynamic>> searchUser({
    required String contactType,
    required String contact,
  }) async {
    try {
      final response = await apiService.postResponse(
        endPoint: '/patient/searchLogin',
        data: {
          'searchMethod': contactType,
          'content': contact,
        },
      );

      final statusCode = response.statusCode ?? 0;
      final responseData = _toMap(response.data);

      return {
        'success': statusCode >= 200 && statusCode < 300,
        'statusCode': statusCode,
        'message': responseData['message'] ?? '',
        'data': responseData['data'] ?? {},
      };
    } on DioException catch (error) {
      final response = error.response;
      final responseData = _toMap(response?.data);

      return {
        'success': false,
        'statusCode': response?.statusCode,
        'message': responseData['message'] ?? _getDioErrorMessage(error),
        'data': responseData['data'] ?? {},
      };
    } catch (error) {
      return {
        'success': false,
        'statusCode': null,
        'message': error.toString(),
        'data': {},
      };
    }
  }

  Future<Map<String, dynamic>> searchUserByEmail({
    required String email,
  }) {
    return searchUser(
      contactType: 'email',
      contact: email,
    );
  }

  Future<Map<String, dynamic>> searchUserByPhone({
    required String phone,
  }) {
    return searchUser(
      contactType: 'phone',
      contact: phone,
    );
  }

  Future<Map<String, dynamic>> verifyPhonePreRegister({
    required String contact,
  }) async {
    try {
      final response = await apiService.postResponse(
        endPoint: '/patient/preRegister',
        data: {
          'identity': contact,
        },
      );

      final statusCode = response.statusCode ?? 0;
      final responseData = _toMap(response.data);

      return {
        'success': statusCode >= 200 && statusCode < 300,
        'statusCode': statusCode,
        'message': responseData['message'] ?? '',
        'data': responseData['data'] ?? {},
      };
    } on DioException catch (error) {
      final response = error.response;
      final responseData = _toMap(response?.data);

      return {
        'success': false,
        'statusCode': response?.statusCode,
        'message': responseData['message'] ?? _getDioErrorMessage(error),
        'data': responseData['data'] ?? {},
      };
    } catch (error) {
      return {
        'success': false,
        'statusCode': null,
        'message': error.toString(),
        'data': {},
      };
    }
  }

  Future<Map<String, dynamic>> verifyPreRegistration({
    required String identity,
    required String otp,
  }) async {
    try {
      final response = await apiService.postResponse(
        endPoint: '/patient/verifyPreRegistration',
        data: {
          'identity': identity,
          'otp': otp,
        },
      );

      final statusCode = response.statusCode ?? 0;
      final responseData = _toMap(response.data);

      return {
        'success': statusCode >= 200 && statusCode < 300,
        'statusCode': statusCode,
        'message': responseData['message'] ?? '',
        'data': responseData['data'] ?? {},
      };
    } on DioException catch (error) {
      final response = error.response;
      final responseData = _toMap(response?.data);

      return {
        'success': false,
        'statusCode': response?.statusCode,
        'message': responseData['message'] ?? _getDioErrorMessage(error),
        'data': responseData['data'] ?? {},
      };
    } catch (error) {
      return {
        'success': false,
        'statusCode': null,
        'message': error.toString(),
        'data': {},
      };
    }
  }

  Future<Map<String, dynamic>> verifyPhoneLogin({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await apiService.postResponse(
        endPoint: '/patient/verifyPhoneLogin',
        data: {
          'phone': phone,
          'otp': otp,
        },
      );

      final statusCode = response.statusCode ?? 0;
      final responseData = _toMap(response.data);

      return {
        'success': statusCode >= 200 && statusCode < 300,
        'statusCode': statusCode,
        'message': responseData['message'] ?? '',
        'data': responseData['data'] ?? {},
      };
    } on DioException catch (error) {
      final response = error.response;
      final responseData = _toMap(response?.data);

      return {
        'success': false,
        'statusCode': response?.statusCode,
        'message': responseData['message'] ?? _getDioErrorMessage(error),
        'data': responseData['data'] ?? {},
      };
    } catch (error) {
      return {
        'success': false,
        'statusCode': null,
        'message': error.toString(),
        'data': {}
      };
    }
  }

  Map<String, dynamic> _toMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }

    if (data is Map) {
      return Map<String, dynamic>.from(data);
    }

    return {};
  }

  String _getDioErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout, please try again';
      case DioExceptionType.badCertificate:
        return 'Bad certificate';
      case DioExceptionType.badResponse:
        return 'Request failed';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'No internet connection';
      case DioExceptionType.unknown:
        return 'Something went wrong';
    }
  }
}
