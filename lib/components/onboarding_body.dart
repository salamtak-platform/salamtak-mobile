import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/components/main_button.dart';
import 'package:salamtak/views/continue_with_phone_view.dart';

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
            color: AppColors.naturalWhite,
            fontFamily: "Baloo Bhaijaan 2",
            fontSize: 24,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
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
