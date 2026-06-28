import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/dot.dart';

class ViewIndicator extends StatelessWidget {
  final List<bool> selectedView;
  const ViewIndicator({super.key, required this.selectedView});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.naturalWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            selectedView.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Dot(isSelected: selectedView[index]),
            ),
          ),
        ),
      ),
    );
  }
}
