import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/features/auth/views/login_with_email.dart';

class ResetPasswordView extends StatefulWidget {
  static String id = "ResetPasswordView";

  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String password = '';
  String confirmPassword = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    // Retrieve OTP from arguments
    final String otp = ModalRoute.of(context)!.settings.arguments as String;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    'تم إعادة تعيين كلمة المرور بنجاح، يمكنك تسجيل الدخول الآن')),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginWithEmail.id,
            (route) => false,
          );
        } else if (state is ResetPasswordFailureState) {
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
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
                    SharedLocalizations.of(context)!.createNewPassTitle,
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
                    label: SharedLocalizations.of(context)!.inputNewPassLabel,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIconName: FontAwesomeIcons.lock,
                    obscureText: _obscurePassword,
                    suffixIconName: _obscurePassword
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    hint: SharedLocalizations.of(context)!.inputShownPassHint,
                    type: CustomTextFieldType.other,
                    onChanged: (val) {
                      setState(() {
                        password = val;
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
                    height: 24,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    label:
                        SharedLocalizations.of(context)!.inputConfNewPassLabel,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIconName: FontAwesomeIcons.lock,
                    obscureText: _obscureConfirmPassword,
                    suffixIconName: _obscureConfirmPassword
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    hint: SharedLocalizations.of(context)!.inputShownPassHint,
                    type: CustomTextFieldType.other,
                    onChanged: (val) {
                      setState(() {
                        confirmPassword = val;
                      });
                    },
                    onTap: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return "تأكيد كلمة المرور مطلوب";
                      }
                      if (val != password) {
                        return "كلمة المرور غير متطابقة";
                      }
                      return null;
                    },
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final cubit = context.read<AuthCubit>();
                      final isLoading = state is ResetPasswordLoadingState;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                        ),
                        child: CustomMainButton(
                          title: "تأكيد",
                          state: isLoading
                              ? MainButtonStates.loading
                              : MainButtonStates.enabled,
                          style: MainButtonStyles.primary,
                          isLeftIcon: false,
                          isRightIcon: false,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.resetForgottenPassword(
                                email: cubit.email!,
                                otp: otp,
                                password: password,
                              );
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
