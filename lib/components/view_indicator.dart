import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/components/dot.dart';

class ViewIndicator extends StatelessWidget {
  final List selectedView;
  const ViewIndicator({super.key, required this.selectedView});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Dot(isSelected: selectedView[0]),
            Dot(isSelected: selectedView[1]),
            Dot(isSelected: selectedView[2]),
            Dot(isSelected: selectedView[3]),
          ],
        ),
      ),
    );
  }
}
