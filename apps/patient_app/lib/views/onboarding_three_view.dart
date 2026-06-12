import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_onboarding_body.dart';
import 'package:patient_app/components/onboarding_image_container.dart';
import 'package:patient_app/components/view_indicator.dart';
import 'package:patient_app/views/onboarding_four_view.dart';

class OnboardingThreeView extends StatelessWidget {
  const OnboardingThreeView({super.key});

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
              imagePath: "assets/images/patient_onboarding_3.png",
              // imageWidth: 343,
              // imageHeight: 212,
            ),
            SizedBox(height: 32),
            ViewIndicator(selectedView: [false, false, true, false]),
            SizedBox(height: 32),
            CustomOnboardingBody(
              title: "أنسي الورق، ملفاتك الطبية بقت كلها في جيبك!",
              description:
                  "كل الروشتات والأشعات والتحاليل وغيرهم هتلاقي منهم نسخة إلكترونية تقدر تشوفها في أي وقت والطبيب يطلع عليهم بكل سهولة.",
              buttonsCount: 2,
              buttonOneTitle: "التالي",
              buttonTwoTitle: "السابق",
              buttonOneStatus: "secondary",
              buttonTwoStatus: "secondary strocked",
              buttonOnePushView: OnboardingFourView(),
              buttonTwoPushView: OnboardingThreeView(),
            ),
          ],
        ),
      ),
    );
  }
}
