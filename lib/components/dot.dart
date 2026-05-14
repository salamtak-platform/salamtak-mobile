import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';

class Dot extends StatelessWidget {
  const Dot({super.key, required this.isOpened});
  final bool isOpened;

  @override
  Widget build(BuildContext context) {
    final Color color = isOpened
        ? AppColors.patientPrimary
        : AppColors.patientPrimaryLight3;
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(1000),
      ),
    );
  }
}
