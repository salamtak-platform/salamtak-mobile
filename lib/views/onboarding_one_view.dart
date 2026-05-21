import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/components/dot.dart';
import 'package:salamtak/components/main_button.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/components/onboarding_image_container.dart';
import 'package:salamtak/components/view_indicator.dart';
import 'package:salamtak/views/continue_with_phone_view.dart';
import 'package:salamtak/views/onboarding_two_view.dart';

class OnboardingOneView extends StatelessWidget {
  const OnboardingOneView({super.key});

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
            imagePath: "assets/images/patient_onboarding_1.png",
          ),
          ViewIndicator(selectedView: [true, false, false, false]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              spacing: 24,
              children: [
                Text(
                  "اختار أفضل وأقرب طبيب بسهولة وفي أسرع وقت!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.naturalWhite,
                    fontFamily: "Baloo Bhaijaan 2",
                    fontSize: 24,
                  ),
                ),
                Text(
                  "في دقيقة واحدة تقدر تختار بين آلاف الأطباء في كل التخصصات وتقارن بينهم من حيث الخبرة والسعر وحاجات تانية كتير.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.naturalWhite,
                    fontFamily: "Baloo Bhaijaan 2",
                    fontSize: 16,
                    fontWeight: FontWeight(500),
                  ),
                ),
                MainButton(title: "التالي", pushView: OnboardingTwoView()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
