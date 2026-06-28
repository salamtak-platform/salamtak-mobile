import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_main_button.dart';

class CustomOnboardingBody extends StatelessWidget {
  final String title;
  final String description;
  final int buttonsCount;
  final String mainButtonTitle;
  final String? secondaryButtonTitle;
  final MainButtonStates mainButtonStatus;
  final MainButtonStyles mainButtonStyle;
  final MainButtonStates? secondaryButtonStatus;
  final MainButtonStyles? secondaryButtonStyle;

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
    required this.mainButtonStyle,
    required this.mainRoute,
    this.secondaryRoute,
    this.secondaryButtonStyle,
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
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(flex: 1),
            buttonsCount == 1
                ? CustomMainButton(
                    title: mainButtonTitle,
                    isLeftIcon: true,
                    isRightIcon: false,
                    leftIcon: FontAwesomeIcons.chevronLeft,
                    state: MainButtonStates.enabled,
                    onPressed: () {
                      Navigator.pushNamed(context, mainRoute);
                    },
                    style: mainButtonStyle,
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomMainButton(
                          title: secondaryButtonTitle!,
                          isLeftIcon: false,
                          isRightIcon: true,
                          rightIcon: FontAwesomeIcons.chevronRight,
                          state: secondaryButtonStatus!,
                          onPressed: () {
                            if (secondaryRoute != null) {
                              Navigator.pushNamed(context, secondaryRoute!);
                            }
                          },
                          style: secondaryButtonStyle!,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: CustomMainButton(
                          title: mainButtonTitle,
                          isLeftIcon: true,
                          isRightIcon: false,
                          leftIcon: FontAwesomeIcons.chevronLeft,
                          state: mainButtonStatus,
                          onPressed: () {
                            Navigator.pushNamed(context, mainRoute);
                          },
                          style: mainButtonStyle,
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
