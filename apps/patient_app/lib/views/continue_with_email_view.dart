import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/main_button.dart';
import 'package:patient_app/views/email_otp_view.dart';

class ContinueWithEmailView extends StatelessWidget {
  static String id = "ContinueWithEmailView";

  const ContinueWithEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.naturalWhite,
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SharedLocalizations.of(context)!.continueWithEmailTitle,
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
                      label: SharedLocalizations.of(context)!.inputEmailLabel,
                      keyboardType: TextInputType.emailAddress,
                      prefixIconName: FontAwesomeIcons.envelope,
                      hint: SharedLocalizations.of(context)!.inputEmailHint,
                      type: CustomTextFieldType.other),
                  const Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: MainButton(
                      title: SharedLocalizations.of(context)!.onboardingNext,
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
