import 'package:dio/dio.dart';
import 'package:patient_app/api_service.dart';

class HakimAiService {
  HakimAiService({required this.apiService});

  final ApiService apiService;

  Future<String> sendMessage({
    required String message,
    bool useEnglish = false,
  }) async {
    try {
      final requestBody = <String, dynamic>{
        'message': message,
        if (useEnglish) 'language': 'en',
      };

      final response = await apiService.postResponse(
        endPoint: '/aiChatbot/PatientMessage',
        data: requestBody,
      );

      final responseData = _toMap(response.data);
      final reply = _extractReply(responseData);
      if (reply.isNotEmpty) {
        return reply;
      }

      throw Exception(
        responseData['message']?.toString() ?? 'No response was returned',
      );
    } on DioException catch (error) {
      final responseData = _toMap(error.response?.data);
      throw Exception(
        responseData['message']?.toString() ?? _getDioErrorMessage(error),
      );
    }
  }

  Future<void> closeChatSession() async {
    try {
      await apiService.postResponse(endPoint: '/aiChatbot/closeChatSession');
    } on DioException {
      // Closing the session is best-effort and should not disturb navigation.
    }
  }

  String _extractReply(Map<String, dynamic> responseData) {
    final data = _toMap(responseData['data']);
    final nestedReply = _toMap(data['reply']);

    final candidates = [
      nestedReply['reply'],
      data['reply'],
      data['message'],
      responseData['reply'],
      responseData['response'],
    ];

    for (final candidate in candidates) {
      final value = candidate?.toString().trim() ?? '';
      if (value.isNotEmpty) return value;
    }

    return '';
  }

  Map<String, dynamic> _toMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
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
