import 'package:flutter/material.dart';
import 'package:salamtak/components/dot.dart';
import 'package:salamtak/components/main_button.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/screens/continue_with_phone.dart';

class OnboardingFourScreen extends StatelessWidget {
  const OnboardingFourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.patientPrimary,
      appBar: AppBar(
        leading: Icon(Icons.arrow_right),
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
          Transform.translate(
            offset: const Offset(0, -1),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.naturalWhite,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      right: 16,
                      left: 16,
                    ),
                    child: Expanded(
                      child: Image(
                        image: AssetImage(
                          "assets/images/patient_onboarding_1.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.naturalWhite,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Dot(isOpened: false),
                  Dot(isOpened: false),
                  Dot(isOpened: false),
                  Dot(isOpened: true),
                ],
              ),
            ),
          ),
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
                MainButton(
                  title: "التالي",
                  buttonFunction: Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ContinueWithPhone();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
