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
