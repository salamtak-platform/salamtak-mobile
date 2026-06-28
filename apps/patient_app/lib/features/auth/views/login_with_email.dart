import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/features/main_view.dart';
import 'package:patient_app/features/auth/views/reset_password_otp_view.dart';

class LoginWithEmail extends StatefulWidget {
  static String id = "LoginWithEmail";

  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final _formKey = GlobalKey<FormState>();
  String? password;
  bool _obscurePassword = true;
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is EmailLoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainView.id,
            (route) => false,
          );
        } else if (state is EmailLoginFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is ForgetPasswordSuccessState) {
          Navigator.pushNamed(context, ResetPasswordOtpView.id);
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
          elevation: 0,
          backgroundColor: AppColors.naturalWhite,
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SharedLocalizations.of(context)!.loginTitle,
                    style: const TextStyle(
                      fontFamily: "Baloo Bhaijaan 2",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    label: SharedLocalizations.of(context)!.inputPassLabel,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIconName: FontAwesomeIcons.lock,
                    obscureText: _obscurePassword,
                    suffixIconName: _obscurePassword
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    hint: SharedLocalizations.of(context)!.inputShownPassHint,
                    type: CustomTextFieldType.other,
                    showError: showError,
                    errorMessage: "كلمة المرور غير صحيحة",
                    onChanged: (val) {
                      setState(() {
                        password = val;
                        showError = false;
                      });
                    },
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return "كلمة المرور مطلوبة";
                      }
                      if (val.length < 8) {
                        return "كلمة المرور يجب أن تكون 8 أحرف على الأقل";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: WidgetStateColor.transparent,
                    ),
                    onPressed: () {
                      final cubit = context.read<AuthCubit>();
                      if (cubit.email != null && cubit.email!.isNotEmpty) {
                        cubit.forgetPassword(email: cubit.email!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('البريد الإلكتروني غير متوفر')),
                        );
                      }
                    },
                    child: const Text(
                      "هل نسيت كلمة السر؟",
                      style: TextStyle(
                          color: AppColors.patientPrimary,
                          fontFamily: "Baloo Bhaijaan 2",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.patientPrimary),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final cubit = context.read<AuthCubit>();
                      final isLoading = state is EmailLoginLoadingState;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                        ),
                        child: CustomMainButton(
                          title: SharedLocalizations.of(context)!.loginButton,
                          state: isLoading
                              ? MainButtonStates.loading
                              : MainButtonStates.enabled,
                          style: MainButtonStyles.primary,
                          isLeftIcon: false,
                          isRightIcon: false,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.emailLogin(
                                email: cubit.email!,
                                password: password!.trim(),
                              );
                            } else {
                              setState(() {
                                showError = true;
                              });
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
