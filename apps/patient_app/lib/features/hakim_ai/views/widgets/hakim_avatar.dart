import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';

class HakimAvatar extends StatelessWidget {
  const HakimAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/patient_logo.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: -2,
            bottom: 1,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: AppColors.alertSuccess,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.naturalWhite, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
