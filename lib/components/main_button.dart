import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.buttonFunction,
  });
  final String title;
  final VoidCallback buttonFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Expanded(
        child: Container(
          height: 48,

          decoration: BoxDecoration(
            color: AppColors.patientPrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 20,
                fontWeight: FontWeight(500),
                color: AppColors.naturalWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
