import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/components/custom_onboarding_body.dart';
import 'package:salamtak/components/onboarding_image_container.dart';
import 'package:salamtak/components/view_indicator.dart';
import 'package:salamtak/views/onboarding_one_view.dart';
import 'package:salamtak/views/onboarding_three_view.dart';

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
              title: "كمل رحلة علاجك بسهولة من غير لف كتير!",
              description:
                  "بدوسة زرار تقدر تحجز كل الأشعات والتحاليل وتطلب الأدوية اللي الطبيب كتبهالك في الروشتة مع شركائنا المتميزين.",
              buttonsCount: 2,
              buttonOneTitle: "التالي",
              buttonTwoTitle: "السابق",
              buttonOneStatus: "secondary",
              buttonTwoStatus: "secondary strocked",
              buttonOnePushView: OnboardingThreeView(),
              buttonTwoPushView: OnboardingOneView(),
            ),
          ],
        ),
      ),
    );
  }
}
