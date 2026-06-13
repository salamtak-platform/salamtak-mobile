import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';

class CustomTermsPrivacyNotice extends StatelessWidget {
  const CustomTermsPrivacyNotice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        spacing: 8,
        children: [
          FaIcon(
            FontAwesomeIcons.circleInfo,
            size: 24,
            color: AppColors.patientPrimary,
          ),
          Expanded(
            child: Text(
              SharedLocalizations.of(context)!.termsPrivacyAgreement,
              maxLines: 2,
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 12,
                fontWeight: FontWeight(500),
                color: AppColors.naturalDarkGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
