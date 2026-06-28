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

  Future<Map<String, dynamic>> emailLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.postResponse(
        endPoint: '/patient/emailLogin',
        data: {
          'email': email,
          'password': password,
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

  Future<Map<String, dynamic>> completeRegistration({
    required String registrationToken,
    required String firstName,
    required String lastName,
    required String phone,
    required String dateOfBirth,
    required String password,
    required String confirmPassword,
    String? email,
    String? gender,
    String? profileImagePath,
  }) async {
    try {
      dynamic requestData;
      if (profileImagePath != null) {
        final Map<String, dynamic> map = {
          'registrationToken': registrationToken,
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
          'dateOfBirth': dateOfBirth,
          'password': password,
          'confirmPassword': confirmPassword,
        };
        if (email != null && email.isNotEmpty) map['email'] = email;
        if (gender != null && gender.isNotEmpty) map['gender'] = gender;

        map['profileImage'] = await MultipartFile.fromFile(
          profileImagePath,
          filename: profileImagePath.split('/').last,
        );
        requestData = FormData.fromMap(map);
      } else {
        final Map<String, dynamic> map = {
          'registrationToken': registrationToken,
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
          'dateOfBirth': dateOfBirth,
          'password': password,
          'confirmPassword': confirmPassword,
        };
        if (email != null && email.isNotEmpty) map['email'] = email;
        if (gender != null && gender.isNotEmpty) map['gender'] = gender;
        requestData = map;
      }

      final response = await apiService.postResponse(
        endPoint: '/patient/completeRegistration',
        data: requestData,
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

  Map<String, dynamic> _toMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }

    if (data is Map) {
      return Map<String, dynamic>.from(data);
    }

    return {};
  }

  Future<Map<String, dynamic>> resendOtp({
    required String content,
  }) async {
    try {
      final response = await apiService.patchResponse(
        endPoint: '/patient/resendOtp',
        data: {
          'content': content,
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

  Future<Map<String, dynamic>> resendPhoneLoginOTP({
    required String phone,
  }) async {
    try {
      final response = await apiService.postResponse(
        endPoint: '/patient/resendPhoneLoginOTP',
        data: {
          'phone': phone,
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

  Future<Map<String, dynamic>> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await apiService.patchResponse(
        endPoint: '/patient/forgetPassword',
        data: {
          'email': email,
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

  Future<Map<String, dynamic>> resetForgottenPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    try {
      final response = await apiService.patchResponse(
        endPoint: '/patient/resetForgottenPassword',
        data: {
          'email': email,
          'otp': otp,
          'password': password,
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
