abstract class AuthState {}

// ------------------------------------------

class PhoneSearchInitialState extends AuthState {}

class PhoneSearchLoadingState extends AuthState {}

class PhoneSearchFoundState extends AuthState {}

class PhoneSearchNotFoundState extends AuthState {}

class PhoneSearchFailureState extends AuthState {}

// -------------------------------------------

class VerifyPhoneRegisterInitialState extends AuthState {}

class VerifyPhoneRegisterLoadingState extends AuthState {}

class VerifyPhoneRegisterSuccessState extends AuthState {}

class VerifyPhoneRegisterFailureState extends AuthState {}

// ------------------------------------------------

class EmailSearchInitialState extends AuthState {}

class EmailSearchLoadingState extends AuthState {}

class EmailSearchSuccessState extends AuthState {
  final String message;

  EmailSearchSuccessState(this.message);
}

class EmailSearchFoundState extends AuthState {}

class EmailSearchNotFoundState extends AuthState {}

class EmailSearchFailureState extends AuthState {
  final String error;
  EmailSearchFailureState(this.error);
}

// -------------------------------------------

class EmailOtpInitial extends AuthState {}

class EmailOtpLoading extends AuthState {}

class EmailOtpSuccess extends AuthState {
  final String message;

  EmailOtpSuccess(this.message);
}

class EmailOtpFailure extends AuthState {
  final String error;
  EmailOtpFailure(this.error);
}

// -------------------------------------------

class CreatePasswordInitial extends AuthState {}

class CreatePasswordLoading extends AuthState {}

class CreatePasswordSuccess extends AuthState {
  final String message;

  CreatePasswordSuccess(this.message);
}

class CreatePasswordFailure extends AuthState {
  final String error;
  CreatePasswordFailure(this.error);
}

// -------------------------------------------

class CompleteAccountInitial extends AuthState {}

class CompleteAccountLoading extends AuthState {}

class CompleteAccountSuccess extends AuthState {
  final String message;

  CompleteAccountSuccess(this.message);
}

class CompleteAccountFailure extends AuthState {
  final String error;
  CompleteAccountFailure(this.error);
}

// ---------------------------------------------

class VerifyPhoneLoginInitialState extends AuthState {}

class VerifyPhoneLoginLoadingState extends AuthState {}

class VerifyPhoneLoginSuccessState extends AuthState {
  final String accessToken;
  final String refreshToken;

  VerifyPhoneLoginSuccessState(
      {required this.accessToken, required this.refreshToken});
}

class VerifyPhoneLoginFailureState extends AuthState {
  final String error;
  VerifyPhoneLoginFailureState(this.error);
}

// -------------------------------------------

class ResendOtpLoadingState extends AuthState {}

class ResendOtpSuccessState extends AuthState {
  final String message;
  ResendOtpSuccessState(this.message);
}

class ResendOtpFailureState extends AuthState {
  final String error;
  ResendOtpFailureState(this.error);
}

// -------------------------------------------

class EmailLoginInitialState extends AuthState {}

class EmailLoginLoadingState extends AuthState {}

class EmailLoginSuccessState extends AuthState {
  final String accessToken;
  final String refreshToken;

  EmailLoginSuccessState(
      {required this.accessToken, required this.refreshToken});
}

class EmailLoginFailureState extends AuthState {
  final String error;
  EmailLoginFailureState(this.error);
}

// -------------------------------------------

class ForgetPasswordInitialState extends AuthState {}

class ForgetPasswordLoadingState extends AuthState {}

class ForgetPasswordSuccessState extends AuthState {
  final String message;
  ForgetPasswordSuccessState(this.message);
}

class ForgetPasswordFailureState extends AuthState {
  final String error;
  ForgetPasswordFailureState(this.error);
}

// -------------------------------------------

class ResetPasswordInitialState extends AuthState {}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {
  final String message;
  ResetPasswordSuccessState(this.message);
}

class ResetPasswordFailureState extends AuthState {
  final String error;
  ResetPasswordFailureState(this.error);
}
