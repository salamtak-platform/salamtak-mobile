import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';

class Dot extends StatelessWidget {
  const Dot({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Color color =
        isSelected ? AppColors.patientPrimary : AppColors.patientPrimaryLight3;
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
