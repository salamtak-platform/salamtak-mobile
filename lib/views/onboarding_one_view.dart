import 'package:flutter/material.dart';
import 'package:salamtak/components/custom_onboarding_body.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/components/onboarding_image_container.dart';
import 'package:salamtak/components/view_indicator.dart';
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
              title: "اختار أفضل وأقرب طبيب بسهولة وفي أسرع وقت!",
              description:
                  "في دقيقة واحدة تقدر تختار بين آلاف الأطباء في كل التخصصات وتقارن بينهم من حيث الخبرة والسعر وحاجات تانية كتير.",
              buttonsCount: 1,
              buttonOneTitle: "التالي",
              buttonOneStatus: "secondary",
              buttonOnePushView: OnboardingTwoView(),
            ),
          ],
        ),
      ),
    );
  }
}
