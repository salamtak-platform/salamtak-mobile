import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/components/opt_input_field.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/features/auth/views/reset_password_view.dart';

class ResetPasswordOtpView extends StatefulWidget {
  static String id = "ResetPasswordOtpView";

  const ResetPasswordOtpView({super.key});

  @override
  State<ResetPasswordOtpView> createState() => _ResetPasswordOtpViewState();
}

class _ResetPasswordOtpViewState extends State<ResetPasswordOtpView> {
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
        if (state is ForgetPasswordSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم إعادة إرسال رمز التحقق بنجاح')),
          );
        } else if (state is ForgetPasswordFailureState) {
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
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final cubit = context.read<AuthCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SharedLocalizations.of(context)!.verifyEmailTitle,
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
                          .verifyEmailBody(cubit.email ?? ""),
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
                              cubit.forgetPassword(email: cubit.email!);
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
                        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                      ),
                      child: CustomMainButton(
                        title: SharedLocalizations.of(context)!.verifyOtpButton,
                        style: MainButtonStyles.primary,
                        state: MainButtonStates.enabled,
                        isLeftIcon: false,
                        isRightIcon: false,
                        onPressed: () {
                          if (otp != null && otp!.length == 6) {
                            Navigator.pushNamed(
                              context,
                              ResetPasswordView.id,
                              arguments: otp!,
                            );
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
