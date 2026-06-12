import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.title, required this.pushView});
  final String title;
  final Widget pushView;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return pushView;
            },
          ),
        );
      },
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
                package: 'ui_kit',
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
