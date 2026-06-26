import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/api_service.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/services/auth_service.dart';

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

  bool? isUserFound;
  bool? isEmailVerified;
  bool? isPhoneVerified;

  Future<void> postsearchUserByPhone({required String phoneNumber}) async {
    this.phoneNumber = phoneNumber;

    emit(PhoneSearchLoadingState());

    try {
      final authService = AuthService(apiService: ApiService(Dio(), Dio()));
      final result = await authService.searchUserByPhone(phone: phoneNumber);

      if (result["message"] == "User not found, please register") {
        emit(PhoneSearchNotFoundState());
        log(result.toString());
        return;
      } else {
        emit(PhoneSearchFoundState());
        log(result.toString());
        return;
      }
    } catch (e) {
      log(e.toString());
      emit(PhoneSearchFailureState());
    }
  }

  Future<void> postVerifyPhonePreRegister({required String contact}) async {
    emit(VerifyPhoneRegisterLoadingState());
    try {
      final authService = AuthService(apiService: ApiService(Dio(), Dio()));
      final result = await authService.verifyPhonePreRegister(contact: contact);
      log(result.toString());
      // emit(PreRegisterSuccessState());
    } catch (e) {
      log(e.toString());
      // emit(PreRegisterFailureState());
    }
  }

  Future<void> verifyPreRegistration(
      {required String identity, required String otp}) async {
    // You can define new states for OTP verification or reuse existing ones.
    // emit(OtpVerificationLoadingState());
    try {
      final authService = AuthService(apiService: ApiService(Dio(), Dio()));
      final result =
          await authService.verifyPreRegistration(identity: identity, otp: otp);
      log(result.toString());
      // emit(OtpVerificationSuccessState());
    } catch (e) {
      log(e.toString());
      // emit(OtpVerificationFailureState());
    }
  }

  Future<void> verifyPhoneLogin(
      {required String phone, required String otp}) async {
    emit(VerifyPhoneLoginLoadingState());
    try {
      final authService = AuthService(apiService: ApiService(Dio(), Dio()));
      final result = await authService.verifyPhoneLogin(phone: phone, otp: otp);

      if (result['success'] == true) {
        final data = result['data'];
        emit(VerifyPhoneLoginSuccessState(
            accessToken: data['accessToken'],
            refreshToken: data['refreshToken']));
      } else {
        emit(VerifyPhoneLoginFailureState(result['message']));
      }
    } catch (e) {
      emit(VerifyPhoneLoginFailureState(e.toString()));
    }
  }
}
