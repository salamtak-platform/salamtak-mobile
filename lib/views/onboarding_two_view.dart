import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/components/main_button.dart';
import 'package:salamtak/components/onboarding_image_container.dart';
import 'package:salamtak/components/view_indicator.dart';
import 'package:salamtak/views/continue_with_phone_view.dart';

class OnboardingTwoView extends StatelessWidget {
  const OnboardingTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.patientPrimary,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "تخطي",
          style: TextStyle(
            color: AppColors.naturalBlack,
            fontFamily: "Baloo Bhaijaan 2",
            fontSize: 20,
          ),
        ),
        backgroundColor: AppColors.naturalWhite,
        elevation: 0.0,
      ),
      body: Column(
        spacing: 32,
        children: [
          OnboardingImageContainer(
            imagePath: "assets/images/patient_onboarding_2.png",
          ),
          ViewIndicator(selectedView: [true, false, false, false]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: OnBoardingBody(),
          ),
        ],
      ),
    );
  }
}

class OnBoardingBody extends StatelessWidget {
  final String title;
  final String description;
  const OnBoardingBody({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.naturalWhite,
            fontFamily: "Baloo Bhaijaan 2",
            fontSize: 24,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.naturalWhite,
            fontFamily: "Baloo Bhaijaan 2",
            fontSize: 16,
            fontWeight: FontWeight(500),
          ),
        ),
        MainButton(title: "التالي", pushView: ContinueWithPhoneView()),
      ],
    );
  }
}
