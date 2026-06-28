import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';

enum MainButtonStyles { primary, secondary, tertiary, tertiaryStroked }

enum MainButtonStates { enabled, disabled, loading }

class CustomMainButton extends StatelessWidget {
  final String title;
  final MainButtonStyles style;
  final MainButtonStates state;
  final bool isLeftIcon;
  final FaIconData? leftIcon;
  final bool isRightIcon;
  final FaIconData? rightIcon;
  final VoidCallback onPressed;

  const CustomMainButton({
    super.key,
    required this.title,
    required this.state,
    required this.isLeftIcon,
    required this.isRightIcon,
    required this.onPressed,
    this.leftIcon,
    this.rightIcon,
    required this.style,
  });

  bool get isLoading => state == MainButtonStates.loading;
  bool get isDisabled => state == MainButtonStates.disabled;

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

  ButtonStyle _secondaryStyle() {
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

  ButtonStyle _tertiaryStrokedStyle() {
    return ElevatedButton.styleFrom(
      foregroundColor: AppColors.naturalWhite,
      side: BorderSide(color: AppColors.naturalWhite, width: 2),
      // minimumSize: Size(double.infinity, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  // ButtonStyle _disabledFilledStyle() {
  //   return ElevatedButton.styleFrom(
  //     backgroundColor: AppColors.naturalLightGray2,
  //     foregroundColor: AppColors.naturalDarkGrey,
  //     minimumSize: Size(double.infinity, 48),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //   );
  // }

  // ButtonStyle _disabledStrockedStyle() {
  //   return ElevatedButton.styleFrom(
  //     foregroundColor: AppColors.naturalDarkGrey,
  //     side: BorderSide(color: AppColors.naturalLightGray2, width: 1),
  //     minimumSize: Size(double.infinity, 48),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //   );
  // }

  Widget _buildContent() {
    final text = Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Baloo Bhaijaan 2",
        fontSize: 16,
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
            color: style == MainButtonStyles.primary ||
                    style == MainButtonStyles.tertiaryStroked
                ? AppColors.naturalWhite
                : AppColors.patientPrimary,
            weight: 24,
          ),
        ],
      );
    }

    if (isRightIcon) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            leftIcon,
            color: style == MainButtonStyles.primary ||
                    style == MainButtonStyles.tertiaryStroked
                ? AppColors.naturalWhite
                : AppColors.patientPrimary,
            weight: 24,
          ),
          Expanded(child: text),
        ],
      );
    }

    if (isLoading) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.naturalDarkGrey,
        ),
      );
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    final widget = style == MainButtonStyles.primary
        ? ElevatedButton(
            style: _primaryStyle(),
            onPressed: (isDisabled || isLoading) ? null : onPressed,
            child: _buildContent(),
          )
        : style == MainButtonStyles.secondary
            ? OutlinedButton(
                style: _secondaryStyle(),
                onPressed: (isDisabled || isLoading) ? null : onPressed,
                child: _buildContent(),
              )
            : style == MainButtonStyles.tertiary
                ? ElevatedButton(
                    style: _tertiaryStyle(),
                    onPressed: (isDisabled || isLoading) ? null : onPressed,
                    child: _buildContent(),
                  )
                : OutlinedButton(
                    style: _tertiaryStrokedStyle(),
                    onPressed: (isDisabled || isLoading) ? null : onPressed,
                    child: _buildContent(),
                  );

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: widget,
    );
  }
}
