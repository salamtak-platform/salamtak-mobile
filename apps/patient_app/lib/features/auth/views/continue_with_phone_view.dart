import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_labeled_divider.dart';
import 'package:patient_app/components/custom_social_button.dart';
import 'package:patient_app/components/custom_terms_privacy_notice.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/features/auth/views/continue_with_email_view.dart';
import 'package:patient_app/features/auth/views/mobile_otp_view.dart';
import 'package:patient_app/features/main_view.dart';

enum CountryCodes { plus20 }

class ContinueWithPhoneView extends StatefulWidget {
  static String id = "ContinueWithPhoneView";

  const ContinueWithPhoneView({super.key});

  @override
  State<ContinueWithPhoneView> createState() => _ContinueWithPhoneViewState();
}

class _ContinueWithPhoneViewState extends State<ContinueWithPhoneView> {
  String? phoneNumber;
  String? countryCode;
  bool showError = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PhoneSearchFoundState ||
            state is PhoneSearchNotFoundState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MobileOtpView(),
            ),
          );
        } else if (state is PhoneSearchFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Phone search failed. Please try again.')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.naturalWhite,
        appBar: AppBar(),
        body: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/images/patient_logo.png",
                        ),
                        width: 64,
                        height: 56,
                      ),
                      SizedBox(height: 24),
                      Text(
                        "انشئ حساب أو سجل الدخول",
                        style: TextStyle(
                          package: 'ui_kit',
                          fontFamily: "Baloo Bhaijaan 2",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "يمكنك المتابعة باستخدام",
                        style: TextStyle(
                          package: 'ui_kit',
                          fontFamily: "Baloo Bhaijaan 2",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 24),
                      CustomTextFormField(
                        readOnly: false,
                        label: SharedLocalizations.of(context)!.inputPhoneLabel,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        prefixIconName: FontAwesomeIcons.phoneFlip,
                        hint: SharedLocalizations.of(context)!.inputPhoneHint,
                        type: CustomTextFieldType.phone,
                        showError: showError,
                        errorMessage: "رقم الهاتف غير صحيح",
                        onChanged: (data) {
                          setState(() {
                            phoneNumber = data;
                            showError = false;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.trim().length != 11) {
                            return "رقم الهاتف يجب أن يكون 11 رقماً";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 32),
                      CustomMainButton(
                          title: SharedLocalizations.of(context)!
                              .continueWithPhoneButton,
                          state: state is PhoneSearchLoadingState
                              ? MainButtonStates.loading
                              : MainButtonStates.enabled,
                          isLeftIcon: false,
                          isRightIcon: false,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().postsearchUserByPhone(
                                    phoneNumber: phoneNumber!,
                                  );
                            } else {
                              setState(() {
                                showError = true;
                              });
                            }
                          },
                          style: MainButtonStyles.primary),
                      SizedBox(height: 24),
                      CustomLabeledDivider(
                          label:
                              SharedLocalizations.of(context)!.commonOrLabel),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          spacing: 8,
                          children: [
                            CustomSocialButton(
                              platform: "google",
                            ),
                            CustomSocialButton(
                              platform: "facebook",
                            ),
                            CustomSocialButton(
                              platform: "email",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ContinueWithEmailView.id);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      CustomLabeledDivider(
                          label: SharedLocalizations.of(context)!
                              .continueAsGuestLabel),
                      SizedBox(height: 24),
                      CustomMainButton(
                          title: SharedLocalizations.of(context)!
                              .continueAsGuestButton,
                          state: MainButtonStates.enabled,
                          isLeftIcon: false,
                          isRightIcon: false,
                          onPressed: () {
                            Navigator.pushNamed(context, MainView.id);
                          },
                          style: MainButtonStyles.secondary),
                      SizedBox(height: 24),
                      CustomTermsPrivacyNotice(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
