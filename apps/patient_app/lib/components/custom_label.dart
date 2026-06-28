import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';

enum LabelTypes { text, textWithIcon, textWithImage }

class Label extends StatelessWidget {
  final String title;
  final FaIconData? icon;
  final Image? imagePath;
  const Label({
    super.key,
    required this.title,
    this.icon,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: BoxBorder.all(
          color: AppColors.naturalLightGray,
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          FaIcon(
            icon,
            size: 24,
            color: AppColors.naturalLightGray,
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                package: 'ui_kit',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
