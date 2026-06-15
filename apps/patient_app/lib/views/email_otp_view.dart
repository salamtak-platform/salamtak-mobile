import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/main_button.dart';
import 'package:patient_app/components/opt_input_field.dart';
import 'package:patient_app/views/home_view.dart';

class EmailOtpView extends StatelessWidget {
  static String id = "EmailOtpView";
  const EmailOtpView({super.key});

  @override
  Widget build(BuildContext context) {
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
              SharedLocalizations.of(context)!.verifyEmailTitle,
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 24,
                fontWeight: FontWeight(500),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              SharedLocalizations.of(context)!
                  .verifyEmailBody("example@test.com"),
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
            OtpInputField(),
            const SizedBox(
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
