import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';

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
            package: 'ui_kit',
            color: AppColors.naturalWhite,
            fontFamily: "Baloo Bhaijaan 2",
            fontSize: 24,
          ),
        ),
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
      ],
    );
  }
}
