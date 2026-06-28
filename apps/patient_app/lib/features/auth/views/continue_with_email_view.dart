import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/features/auth/views/email_otp_view.dart';
import 'package:patient_app/features/auth/views/login_with_email.dart';

class ContinueWithEmailView extends StatefulWidget {
  static String id = "ContinueWithEmailView";

  const ContinueWithEmailView({super.key});

  @override
  State<ContinueWithEmailView> createState() => _ContinueWithEmailViewState();
}

class _ContinueWithEmailViewState extends State<ContinueWithEmailView> {
  String? email;
  bool showError = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is EmailSearchFoundState) {
          Navigator.pushNamed(context, LoginWithEmail.id);
        } else if (state is EmailSearchNotFoundState) {
          Navigator.pushNamed(context, EmailOtpView.id);
        } else if (state is EmailSearchFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.naturalWhite,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.naturalWhite,
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SharedLocalizations.of(context)!.continueWithEmailTitle,
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
                        label: SharedLocalizations.of(context)!.inputEmailLabel,
                        keyboardType: TextInputType.emailAddress,
                        prefixIconName: FontAwesomeIcons.envelope,
                        hint: SharedLocalizations.of(context)!.inputEmailHint,
                        type: CustomTextFieldType.other,
                        showError: showError,
                        errorMessage: "البريد الإلكتروني غير صحيح",
                        onChanged: (val) {
                          setState(() {
                            email = val;
                            showError = false;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "البريد الإلكتروني مطلوب";
                          }
                          final emailRegExp = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (!emailRegExp.hasMatch(value)) {
                            return "البريد الإلكتروني غير صحيح";
                          }
                          return null;
                        },
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                        ),
                        child: CustomMainButton(
                          title:
                              SharedLocalizations.of(context)!.onboardingNext,
                          state: state is EmailSearchLoadingState
                              ? MainButtonStates.loading
                              : MainButtonStates.enabled,
                          style: MainButtonStyles.primary,
                          isLeftIcon: false,
                          isRightIcon: false,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context
                                  .read<AuthCubit>()
                                  .postsearchUserByEmail(email: email!.trim());
                            } else {
                              setState(() {
                                showError = true;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
