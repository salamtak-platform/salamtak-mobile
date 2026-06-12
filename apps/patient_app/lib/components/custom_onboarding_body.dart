import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/main_button.dart';

class CustomOnboardingBody extends StatelessWidget {
  final String title;
  final String description;
  final int buttonsCount;
  final String buttonOneTitle;
  final String? buttonTwoTitle;
  final String buttonOneStatus;
  final String? buttonTwoStatus;
  final Widget buttonOnePushView;
  final Widget? buttonTwoPushView;

  const CustomOnboardingBody({
    super.key,
    required this.title,
    required this.description,
    required this.buttonsCount,
    required this.buttonOneTitle,
    this.buttonTwoTitle,
    required this.buttonOnePushView,
    this.buttonTwoPushView,
    required this.buttonOneStatus,
    this.buttonTwoStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                package: 'ui_kit',
                color: AppColors.naturalWhite,
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 24,
              ),
            ),
            SizedBox(height: 24),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                package: 'ui_kit',
                color: AppColors.naturalWhite,
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 16,
                fontWeight: FontWeight(500),
              ),
            ),
            Spacer(flex: 1),
            buttonsCount == 1
                ? MainButton(
                    title: buttonOneTitle,
                    pushView: buttonOnePushView,
                    status: buttonOneStatus,
                    isLeftIcon: true,
                    isRightIcon: false,
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: MainButton(
                          title: buttonTwoTitle!,
                          pushView: buttonTwoPushView!,
                          status: buttonTwoStatus!,
                          isLeftIcon: false,
                          isRightIcon: true,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: MainButton(
                          title: buttonOneTitle,
                          pushView: buttonOnePushView,
                          status: buttonOneStatus,
                          isLeftIcon: true,
                          isRightIcon: false,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
