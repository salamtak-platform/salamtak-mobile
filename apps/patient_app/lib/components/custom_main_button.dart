import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';

enum MainButtonStyles { primary, secondary, tertiary, tertiaryStrocked }

enum MainButtonStates { enabled, disabled, loading }

class CustomMainButton extends StatelessWidget {
  final String title;
  final MainButtonStyles style;
  final MainButtonStates state;
  final bool isLeftIcon;
  final FaIconData? leftIcon;
  final bool isRightIcon;
  final FaIconData? rightIcon;
  final Function onTap;

  const CustomMainButton({
    super.key,
    required this.title,
    required this.state,
    required this.isLeftIcon,
    required this.isRightIcon,
    required this.onTap,
    this.leftIcon,
    this.rightIcon,
    required this.style,
  });

  ButtonStyle _primaryStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.patientPrimary,
      foregroundColor: AppColors.naturalWhite,
      minimumSize: Size(double.infinity, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  ButtonStyle _SecondaryStyle() {
    return ElevatedButton.styleFrom(
      foregroundColor: AppColors.patientPrimary,
      side: BorderSide(color: AppColors.patientPrimary, width: 1),
      minimumSize: Size(double.infinity, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  ButtonStyle _tertiaryStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.naturalWhite,
      foregroundColor: AppColors.patientPrimary,
      minimumSize: Size(double.infinity, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  ButtonStyle _tertiaryStrockedStyle() {
    return ElevatedButton.styleFrom(
      foregroundColor: AppColors.naturalWhite,
      side: BorderSide(color: AppColors.patientPrimary, width: 1),
      minimumSize: Size(double.infinity, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildContent() {
    final text = Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Baloo Bhaijaan 2",
        fontSize: 20,
        package: 'ui_kit',
        fontWeight: FontWeight(500),
      ),
    );

    if (isLeftIcon) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: text),
          FaIcon(
            leftIcon,
            color: style == MainButtonStyles.primary
                ? AppColors.naturalWhite
                : AppColors.patientPrimary,
            weight: 24,
          )
        ],
      );
    }
    if (isRightIcon) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            leftIcon,
            color: style == MainButtonStyles.primary
                ? AppColors.naturalWhite
                : AppColors.patientPrimary,
            weight: 24,
          ),
          Expanded(child: text),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
