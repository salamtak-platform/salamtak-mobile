import 'package:dio/dio.dart';
import 'package:patient_app/services/auth_interceptor.dart';

class ApiService {
  ApiService(this._dio, dio);

  final Dio _dio;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(AuthInterceptor(dio));
    return ApiService(dio, dio);
  }

  static const String baseUrl = "https://api.salamtakplatform.app/api/v1";

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      "$baseUrl$endPoint",
      queryParameters: queryParameters,
    );

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post(
      "$baseUrl$endPoint",
      data: data,
      queryParameters: queryParameters,
    );

    return response.data;
  }

  Future<Response<dynamic>> postResponse({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.post(
      "$baseUrl$endPoint",
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Map<String, dynamic>> patch({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.patch(
      "$baseUrl$endPoint",
      data: data,
      queryParameters: queryParameters,
    );

    return response.data;
  }

  Future<Response<dynamic>> patchResponse({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.patch(
      "$baseUrl$endPoint",
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.delete(
      "$baseUrl$endPoint",
      data: data,
      queryParameters: queryParameters,
    );

    return response.data;
  }
}
