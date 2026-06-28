import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';

class CustomSocialButton extends StatelessWidget {
  final String platform;
  final VoidCallback? onTap;

  const CustomSocialButton({
    super.key,
    required this.platform,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: platform == "google"
                  ? AppColors.naturalWhite
                  : platform == "facebook"
                      ? AppColors.otherFacebookPrimary
                      : AppColors.naturalLightGray,
              border: platform == "google"
                  ? BoxBorder.all(
                      color: AppColors.naturalLightGray,
                      width: 1,
                    )
                  : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              platform == "google"
                  ? Image.asset(
                      "assets/images/google_icon.png",
                      package: 'ui_kit',
                      width: 24,
                      height: 24,
                    )
                  : FaIcon(
                      platform == "facebook"
                          ? FontAwesomeIcons.facebook
                          : FontAwesomeIcons.solidEnvelope,
                      color: AppColors.naturalWhite,
                      size: 24,
                    ),
              Text(
                platform == "google"
                    ? SharedLocalizations.of(context)!.continueWithGoogleButton
                    : platform == "facebook"
                        ? SharedLocalizations.of(context)!.continueWithFbButton
                        : SharedLocalizations.of(context)!
                            .continueWithEmailButton,
                style: TextStyle(
                    fontFamily: "Baloo Bhaijaan 2",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: platform == "google"
                        ? AppColors.naturalBlack
                        : AppColors.naturalWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
