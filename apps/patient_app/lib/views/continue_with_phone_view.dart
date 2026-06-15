import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_labeled_divider.dart';
import 'package:patient_app/components/custom_social_button.dart';
import 'package:patient_app/components/custom_terms_privacy_notice.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/main_button.dart';

class ContinueWithPhoneView extends StatelessWidget {
  static String id = "ContinueWithPhoneView";
  const ContinueWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(
        backgroundColor: AppColors.naturalWhite,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
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
                    fontWeight: FontWeight(500),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "يمكنك المتابعة باستخدام",
                  style: TextStyle(
                    package: 'ui_kit',
                    fontFamily: "Baloo Bhaijaan 2",
                    fontSize: 16,
                    fontWeight: FontWeight(500),
                  ),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                    readOnly: false,
                    label: SharedLocalizations.of(context)!.inputPhoneLabel,
                    keyboardType: TextInputType.phone,
                    prefixIconName: FontAwesomeIcons.phoneFlip,
                    hint: SharedLocalizations.of(context)!.inputPhoneHint,
                    type: CustomTextFieldType.phone),
                SizedBox(height: 32),
                MainButton(
                  status: "primary",
                  title: "المتابعة باستخدام رقم الهاتف",
                  route: "MobileOtpView",
                  isLeftIcon: false,
                  isRightIcon: false,
                ),
                SizedBox(height: 24),
                CustomLabeledDivider(
                    label: SharedLocalizations.of(context)!.commonOrLabel),
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
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                CustomLabeledDivider(
                    label:
                        SharedLocalizations.of(context)!.continueAsGuestLabel),
                SizedBox(height: 24),
                MainButton(
                    title:
                        SharedLocalizations.of(context)!.continueAsGuestButton,
                    route: "SplashView",
                    status: "secondary strocked",
                    isLeftIcon: false,
                    isRightIcon: false),
                SizedBox(height: 24),
                CustomTermsPrivacyNotice(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
