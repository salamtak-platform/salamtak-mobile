import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/api_service.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/services/auth_service.dart';
import 'package:patient_app/services/token_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(PhoneSearchInitialState());

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? profileImage;
  String? gender;
  DateTime? dateOfBirth;
  String? registrationToken;

  bool? isUserFound;
  bool? isEmailVerified;
  bool? isPhoneVerified;

  Future<void> postsearchUserByPhone({required String phoneNumber}) async {
    this.phoneNumber = phoneNumber;

    emit(PhoneSearchLoadingState());

    try {
      final authService = AuthService(apiService: ApiService.create());
      final result = await authService.searchUserByPhone(phone: phoneNumber);

      final message = result['message']?.toString() ?? '';
      if (message == "User not found, please register" ||
          message.toLowerCase().contains("user not found")) {
        isUserFound = false;
        log("User not found, proceeding to pre-register phone: $phoneNumber");

        // Wait and perform the second request: preRegister
        final preRegisterResult =
            await authService.verifyPhonePreRegister(contact: phoneNumber);
        if (preRegisterResult["success"] == true) {
          emit(PhoneSearchNotFoundState());
        } else {
          emit(PhoneSearchFailureState());
        }
        log(preRegisterResult.toString());
        return;
      } else if (result['success'] == true) {
        isUserFound = true;
        emit(PhoneSearchFoundState());
        log(result.toString());
        return;
      } else {
        log("Search login error: ${result['message']}");
        emit(PhoneSearchFailureState());
        return;
      }
    } catch (e) {
      log(e.toString());
      emit(PhoneSearchFailureState());
    }
  }

  Future<void> postsearchUserByEmail({required String email}) async {
    this.email = email;

    emit(EmailSearchLoadingState());

    try {
      final authService = AuthService(apiService: ApiService.create());
      final result = await authService.searchUserByEmail(email: email);

      final message = result['message']?.toString() ?? '';
      if (message == "User not found, please register" ||
          message.toLowerCase().contains("user not found")) {
        isUserFound = false;
        log("User not found, proceeding to pre-register email: $email");

        final preRegisterResult =
            await authService.verifyPhonePreRegister(contact: email);
        if (preRegisterResult["success"] == true) {
          emit(EmailSearchNotFoundState());
        } else {
          emit(EmailSearchFailureState(
              preRegisterResult['message'] ?? 'Failed to pre-register.'));
        }
        log(preRegisterResult.toString());
        return;
      } else if (result['success'] == true) {
        isUserFound = true;
        emit(EmailSearchFoundState());
        log(result.toString());
        return;
      } else {
        log("Search login error: ${result['message']}");
        emit(EmailSearchFailureState(
            result['message'] ?? 'Failed to search user.'));
        return;
      }
    } catch (e) {
      log(e.toString());
      emit(EmailSearchFailureState(e.toString()));
    }
  }

  Future<void> postVerifyPhonePreRegister({required String contact}) async {
    emit(VerifyPhoneRegisterLoadingState());
    try {
      final authService = AuthService(apiService: ApiService.create());
      final result = await authService.verifyPhonePreRegister(contact: contact);
      log(result.toString());
      emit(VerifyPhoneRegisterSuccessState());
    } catch (e) {
      log(e.toString());
      emit(VerifyPhoneRegisterFailureState());
    }
  }

  Future<void> verifyPreRegistration(
      {required String identity, required String otp}) async {
    emit(VerifyPhoneRegisterLoadingState());
    try {
      final authService = AuthService(apiService: ApiService.create());
      final result =
          await authService.verifyPreRegistration(identity: identity, otp: otp);
      log(result.toString());
      if (result['success'] == true) {
        final data = result['data'];
        registrationToken = data['registrationToken'];
        emit(VerifyPhoneRegisterSuccessState());
      } else {
        emit(VerifyPhoneRegisterFailureState());
      }
    } catch (e) {
      log(e.toString());
      emit(VerifyPhoneRegisterFailureState());
    }
  }

  Future<void> verifyPhoneLogin(
      {required String phone, required String otp}) async {
    emit(VerifyPhoneLoginLoadingState());
    try {
      final authService = AuthService(apiService: ApiService.create());
      final result = await authService.verifyPhoneLogin(phone: phone, otp: otp);

      if (result['success'] == true) {
        final data = result['data'];
        final accessToken = data['accessToken'];
        final refreshToken = data['refreshToken'];

        // Save tokens locally
        await TokenService.saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        emit(VerifyPhoneLoginSuccessState(
            accessToken: accessToken, refreshToken: refreshToken));
      } else {
        emit(VerifyPhoneLoginFailureState(result['message']));
      }
    } catch (e) {
      emit(VerifyPhoneLoginFailureState(e.toString()));
    }
  }

  Future<void> emailLogin(
      {required String email, required String password}) async {
    emit(EmailLoginLoadingState());
    try {
      final authService = AuthService(apiService: ApiService.create());
      final result =
          await authService.emailLogin(email: email, password: password);

      if (result['success'] == true) {
        final data = result['data'];
        final accessToken = data['accessToken'];
        final refreshToken = data['refreshToken'];

        // Save tokens locally
        await TokenService.saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        emit(EmailLoginSuccessState(
            accessToken: accessToken, refreshToken: refreshToken));
      } else {
        emit(EmailLoginFailureState(result['message']));
      }
    } catch (e) {
      emit(EmailLoginFailureState(e.toString()));
    }
  }

  Future<void> completeRegistration({
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
    emit(CompleteAccountLoading());
    try {
      final authService = AuthService(apiService: ApiService.create());
      final result = await authService.completeRegistration(
        registrationToken: registrationToken ?? '',
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        dateOfBirth: dateOfBirth,
        password: password,
        confirmPassword: confirmPassword,
        email: email,
        gender: gender,
        profileImagePath: profileImagePath,
      );

      if (result['success'] == true) {
        final data = result['data'];
        if (data != null &&
            data['accessToken'] != null &&
            data['refreshToken'] != null) {
          // Save tokens locally
          await TokenService.saveTokens(
            accessToken: data['accessToken'],
            refreshToken: data['refreshToken'],
          );
        }

        emit(CompleteAccountSuccess(
            result['message'] ?? 'Account completed successfully'));
      } else {
        emit(CompleteAccountFailure(
            result['message'] ?? 'Failed to complete account'));
      }
    } catch (e) {
      emit(CompleteAccountFailure(e.toString()));
    }
  }

  Future<void> resendVerificationOtp() async {
    final contact = email ?? phoneNumber;
    if (contact == null || contact.isEmpty) {
      emit(ResendOtpFailureState('Contact information is missing'));
      return;
    }

    emit(ResendOtpLoadingState());
    try {
      final authService = AuthService(apiService: ApiService.create());
      Map<String, dynamic> result;
      if (email != null && email!.isNotEmpty) {
        result = await authService.resendOtp(content: contact);
      } else {
        if (isUserFound == true) {
          result = await authService.resendPhoneLoginOTP(phone: contact);
        } else {
          result = await authService.resendOtp(content: contact);
        }
      }

      log(result.toString());
      if (result['success'] == true) {
        emit(ResendOtpSuccessState(
            result['message'] ?? 'OTP sent successfully'));
      } else {
        emit(ResendOtpFailureState(result['message'] ?? 'Failed to send OTP'));
      }
    } catch (e) {
      log(e.toString());
      emit(ResendOtpFailureState(e.toString()));
    }
  }

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoadingState());
    try {
      final authService = AuthService(apiService: ApiService.create());
      final result = await authService.forgetPassword(email: email);
      if (result['success'] == true) {
        emit(ForgetPasswordSuccessState(
            result['message'] ?? 'OTP sent successfully'));
      } else {
        emit(ForgetPasswordFailureState(
            result['message'] ?? 'Failed to request password reset'));
      }
    } catch (e) {
      emit(ForgetPasswordFailureState(e.toString()));
    }
  }

  Future<void> resetForgottenPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    emit(ResetPasswordLoadingState());
    try {
      final authService = AuthService(apiService: ApiService.create());
      final result = await authService.resetForgottenPassword(
        email: email,
        otp: otp,
        password: password,
      );
      if (result['success'] == true) {
        emit(ResetPasswordSuccessState(
            result['message'] ?? 'Password reset successfully'));
      } else {
        emit(ResetPasswordFailureState(
            result['message'] ?? 'Failed to reset password'));
      }
    } catch (e) {
      emit(ResetPasswordFailureState(e.toString()));
    }
  }
}
