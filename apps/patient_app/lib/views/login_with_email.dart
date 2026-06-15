import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/main_button.dart';
import 'package:patient_app/views/email_otp_view.dart';
import 'package:patient_app/views/reset_password_view.dart';

class LoginWithEmail extends StatelessWidget {
  static String id = "LoginWithEmail";

  const LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.naturalWhite,
      ),
      body: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SharedLocalizations.of(context)!.loginTitle,
                    style: TextStyle(
                      fontFamily: "Baloo Bhaijaan 2",
                      fontSize: 24,
                      fontWeight: FontWeight(500),
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
                      suffixIconName: FontAwesomeIcons.eyeSlash,
                      hint: SharedLocalizations.of(context)!.inputShownPassHint,
                      type: CustomTextFieldType.other),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: WidgetStateColor.transparent,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ResetPasswordView.id);
                    },
                    child: Text(
                      "هل نسيت كلمة السر؟",
                      style: TextStyle(
                          color: AppColors.patientPrimary,
                          fontFamily: "Baloo Bhaijaan 2",
                          fontSize: 12,
                          fontWeight: FontWeight(500),
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.patientPrimary),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: MainButton(
                      title: SharedLocalizations.of(context)!.loginButton,
                      status: "primary",
                      isLeftIcon: false,
                      isRightIcon: false,
                      route: EmailOtpView.id,
                    ),
                  ),
                ],
              ))),
    );
  }
}
