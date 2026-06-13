import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/main_button.dart';
import 'package:patient_app/views/home.dart';
import 'package:pinput/pinput.dart';

class MobileOtpView extends StatelessWidget {
  static String id = "MobileOtpView";
  const MobileOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 64,
      textStyle: TextStyle(
          fontFamily: "Baloo Bhaijaan 2",
          fontSize: 48,
          fontWeight: FontWeight(500),
          color: AppColors.patientPrimary),
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        border: Border.all(
          color: AppColors.naturalLightGray2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.patientPrimary, width: 1),
    );
    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
        color: AppColors.patientPrimaryLight4,
        border: Border.all(
          color: AppColors.patientPrimary,
          width: 2,
        ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(
        backgroundColor: AppColors.naturalWhite,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              SharedLocalizations.of(context)!.verifyPhoneTitle,
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 24,
                fontWeight: FontWeight(500),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              SharedLocalizations.of(context)!.verifyPhoneBody("0123456789+"),
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                color: AppColors.naturalDarkGrey,
                fontSize: 16,
                fontWeight: FontWeight(500),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Center(
              child: Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              SharedLocalizations.of(context)!.resendOtpText(59),
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                color: AppColors.naturalDarkGrey,
                fontSize: 16,
                fontWeight: FontWeight(500),
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
                title: SharedLocalizations.of(context)!.verifyOtpButton,
                status: "primary",
                isLeftIcon: false,
                isRightIcon: false,
                route: HomeView.id,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
