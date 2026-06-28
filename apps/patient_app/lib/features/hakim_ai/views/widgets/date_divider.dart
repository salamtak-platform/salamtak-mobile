import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/text_styles.dart';

class DateDivider extends StatelessWidget {
  const DateDivider({
    super.key,
    this.label = 'Today',
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Row(
        children: [
          const Expanded(child: Divider(color: AppColors.naturalLightGray2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              label,
              style: AppTextStyles().subBodyReg.copyWith(
                    color: AppColors.naturalDarkGrey,
                  ),
            ),
          ),
          const Expanded(child: Divider(color: AppColors.naturalLightGray2)),
        ],
      ),
    );
  }
}
