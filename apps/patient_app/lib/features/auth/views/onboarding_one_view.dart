import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_onboarding_body.dart';
import 'package:patient_app/components/onboarding_image_container.dart';
import 'package:patient_app/components/view_indicator.dart';
import 'package:patient_app/src/generated/patient_localizations.dart';
import 'package:patient_app/features/auth/views/onboarding_two_view.dart';

class OnboardingOneView extends StatelessWidget {
  static String id = "OnboardingOneView";
  const OnboardingOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.patientPrimary,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          SharedLocalizations.of(context)!.commonSkip,
          style: TextStyle(
            color: AppColors.naturalBlack,
            fontFamily: "Baloo Bhaijaan 2",
            fontSize: 20,
          ),
        ),
        backgroundColor: AppColors.naturalWhite,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            OnboardingImageContainer(
              imagePath: "assets/images/patient_onboarding_1.png",
              // imageWidth: 343,
              // imageHeight: 212,
            ),
            SizedBox(height: 32),
            ViewIndicator(selectedView: [true, false, false, false]),
            SizedBox(height: 32),
            CustomOnboardingBody(
              title: PatientLocalizations.of(context)!.onboardingOneTitle,
              description: PatientLocalizations.of(context)!.onboardingOneBody,
              buttonsCount: 1,
              mainButtonTitle: SharedLocalizations.of(context)!.onboardingNext,
              mainButtonStatus: "secondary",
              mainRoute: OnboardingTwoView.id,
            ),
          ],
        ),
      ),
    );
  }
}
