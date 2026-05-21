import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';

class OnboardingImageContainer extends StatelessWidget {
  final String imagePath;
  const OnboardingImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
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
              padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
              child: Expanded(child: Image(image: AssetImage(imagePath))),
            ),
          ],
        ),
      ),
    );
  }
}
