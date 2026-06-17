import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_main_button.dart';

class CustomOnboardingBody extends StatelessWidget {
  final String title;
  final String description;
  final int buttonsCount;
  final String mainButtonTitle;
  final String? secondaryButtonTitle;
  final String mainButtonStatus;
  final String? secondaryButtonStatus;
  final String mainRoute;
  final String? secondaryRoute;

  const CustomOnboardingBody({
    super.key,
    required this.title,
    required this.description,
    required this.buttonsCount,
    required this.mainButtonTitle,
    this.secondaryButtonTitle,
    required this.mainButtonStatus,
    this.secondaryButtonStatus,
    required this.mainRoute,
    this.secondaryRoute,
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
                ? CustomMainButton(
                    title: mainButtonTitle,
                    route: mainRoute,
                    status: mainButtonStatus,
                    isLeftIcon: true,
                    isRightIcon: false,
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomMainButton(
                          title: secondaryButtonTitle!,
                          // route: secondaryRoute!,
                          // status: secondaryButtonStatus!,
                          isLeftIcon: false,
                          isRightIcon: true,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: CustomMainButton(
                          title: mainButtonTitle,
                          route: mainRoute,
                          status: mainButtonStatus,
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
