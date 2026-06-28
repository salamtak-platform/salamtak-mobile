import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/features/auth/views/email_otp_view.dart';

class CreatePasswordView extends StatelessWidget {
  static String id = "AddEmail";

  const CreatePasswordView({super.key});

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
                    SharedLocalizations.of(context)!.createPassTitle,
                    style: TextStyle(
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
                    suffixIconName: FontAwesomeIcons.eyeSlash,
                    hint: SharedLocalizations.of(context)!.inputShownPassHint,
                    type: CustomTextFieldType.other,
                    onChanged: (String value) {},
                    validator: (String? value) => null,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    label: SharedLocalizations.of(context)!.inputConfPassLabel,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIconName: FontAwesomeIcons.lock,
                    suffixIconName: FontAwesomeIcons.eyeSlash,
                    hint: SharedLocalizations.of(context)!.inputShownPassHint,
                    type: CustomTextFieldType.other,
                    onChanged: (String value) {},
                    validator: (String? value) => null,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: CustomMainButton(
                      title: SharedLocalizations.of(context)!.onboardingNext,
                      state: MainButtonStates.enabled,
                      style: MainButtonStyles.primary,
                      isLeftIcon: false,
                      isRightIcon: false,
                      onPressed: () {
                        Navigator.pushNamed(context, EmailOtpView.id);
                      },
                    ),
                  ),
                ],
              ))),
    );
  }
}
