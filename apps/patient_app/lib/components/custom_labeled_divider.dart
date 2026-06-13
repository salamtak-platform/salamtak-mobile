import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';

class CustomLabeledDivider extends StatelessWidget {
  final String label;
  const CustomLabeledDivider({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: Divider(height: 1, color: AppColors.naturalLightGray),
        ),
        Text(
          label,
          style: TextStyle(
            package: 'ui_kit',
            fontFamily: "Baloo Bhaijaan 2",
            fontSize: 16,
            fontWeight: FontWeight(500),
          ),
        ),
        Expanded(
          child: Divider(height: 1, color: AppColors.naturalLightGray),
        ),
      ],
    );
  }
}
