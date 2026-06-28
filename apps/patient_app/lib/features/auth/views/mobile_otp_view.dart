import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/components/opt_input_field.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/features/auth/views/complete_account.dart';
import 'package:patient_app/features/main_view.dart';

class MobileOtpView extends StatefulWidget {
  static String id = "MobileOtpView";

  const MobileOtpView({super.key});

  @override
  State<MobileOtpView> createState() => _MobileOtpViewState();
}

class _MobileOtpViewState extends State<MobileOtpView> {
  String? otp;
  int _secondsRemaining = 59;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 59;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerifyPhoneLoginSuccessState) {
          Navigator.pushNamed(context, MainView.id);
        } else if (state is VerifyPhoneRegisterSuccessState) {
          Navigator.pushNamed(context, CompleteAccount.id);
        } else if (state is VerifyPhoneLoginFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is VerifyPhoneRegisterFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('كود التحقق غير صحيح، برجاء المحاولة مرة أخرى')),
          );
        } else if (state is ResendOtpSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is ResendOtpFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.naturalWhite,
        appBar: AppBar(
          backgroundColor: AppColors.naturalWhite,
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final cubit = context.read<AuthCubit>();
                final isLoading = state is VerifyPhoneLoginLoadingState ||
                    state is VerifyPhoneRegisterLoadingState;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SharedLocalizations.of(context)!.verifyPhoneTitle,
                      style: const TextStyle(
                        fontFamily: "Baloo Bhaijaan 2",
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      SharedLocalizations.of(context)!
                          .verifyPhoneBody(cubit.phoneNumber ?? ""),
                      style: TextStyle(
                        fontFamily: "Baloo Bhaijaan 2",
                        color: AppColors.naturalDarkGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    OtpInputField(
                      onCompleted: (value) {
                        otp = value;
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    _secondsRemaining > 0
                        ? Text(
                            SharedLocalizations.of(context)!
                                .resendOtpText(_secondsRemaining),
                            style: TextStyle(
                              fontFamily: "Baloo Bhaijaan 2",
                              color: AppColors.naturalDarkGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              context.read<AuthCubit>().resendVerificationOtp();
                              _startTimer();
                            },
                            child: const Text(
                              'لم تستلم الرمز؟ إعادة إرسال الرمز',
                              style: TextStyle(
                                fontFamily: "Baloo Bhaijaan 2",
                                color: AppColors.patientPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                    const Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: CustomMainButton(
                        title: SharedLocalizations.of(context)!.verifyOtpButton,
                        style: MainButtonStyles.primary,
                        state: isLoading
                            ? MainButtonStates.loading
                            : MainButtonStates.enabled,
                        isLeftIcon: false,
                        isRightIcon: false,
                        onPressed: () {
                          if (otp != null && otp!.length == 6) {
                            if (cubit.isUserFound == true) {
                              cubit.verifyPhoneLogin(
                                phone: cubit.phoneNumber!,
                                otp: otp!,
                              );
                            } else {
                              cubit.verifyPreRegistration(
                                identity: cubit.phoneNumber!,
                                otp: otp!,
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('برجاء إدخال كود التحقق كاملاً')),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
