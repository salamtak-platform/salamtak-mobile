import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_onboarding_body.dart';
import 'package:patient_app/components/onboarding_image_container.dart';
import 'package:patient_app/components/view_indicator.dart';
import 'package:patient_app/src/generated/patient_localizations.dart';
import 'package:patient_app/views/onboarding_one_view.dart';
import 'package:patient_app/views/onboarding_three_view.dart';
import 'package:localization/localization.dart';

class OnboardingTwoView extends StatelessWidget {
  static String id = "OnboardingTwoView";
  const OnboardingTwoView({super.key});

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
              imagePath: "assets/images/patient_onboarding_2.png",
              // imageWidth: 343,
              // imageHeight: 212,
            ),
            SizedBox(height: 32),
            ViewIndicator(selectedView: [false, true, false, false]),
            SizedBox(height: 32),
            CustomOnboardingBody(
              title: PatientLocalizations.of(context)!.onboardingTwoTitle,
              description: PatientLocalizations.of(context)!.onboardingTwoBody,
              buttonsCount: 2,
              mainButtonTitle: SharedLocalizations.of(context)!.onboardingNext,
              secondaryButtonTitle:
                  SharedLocalizations.of(context)!.onboardingPrev,
              mainButtonStatus: "secondary",
              secondaryButtonStatus: "secondary strocked",
              mainRoute: OnboardingThreeView.id,
              secondaryRoute: OnboardingOneView.id,
            ),
          ],
        ),
      ),
    );
  }
}
