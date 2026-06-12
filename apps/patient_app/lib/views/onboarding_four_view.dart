import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_onboarding_body.dart';
import 'package:patient_app/components/onboarding_image_container.dart';
import 'package:patient_app/components/view_indicator.dart';
import 'package:patient_app/views/continue_with_phone_view.dart';
import 'package:patient_app/views/onboarding_three_view.dart';

class OnboardingFourView extends StatelessWidget {
  const OnboardingFourView({super.key});

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
              imagePath: "assets/images/patient_onboarding_4.png",
              // imageWidth: 343,
              // imageHeight: 212,
            ),
            SizedBox(height: 32),
            ViewIndicator(selectedView: [false, false, false, true]),
            SizedBox(height: 32),
            CustomOnboardingBody(
              title: "مع حكيم AI، هتلاقي إجابات على أسئلتك طوال الـ 24 ساعة!",
              description:
                  "تقدر تسأل حكيم AI على أي حاجة بخصوص صحتك وهيجاوب عليك إجابات موثوقة 100% من غير ما تحتاج تدور كتير.",
              buttonsCount: 2,
              buttonOneTitle: "ابدأ الآن!",
              buttonTwoTitle: "السابق",
              buttonOneStatus: "secondary",
              buttonTwoStatus: "secondary strocked",
              buttonOnePushView: ContinueWithPhoneView(),
              buttonTwoPushView: OnboardingThreeView(),
            ),
          ],
        ),
      ),
    );
  }
}
