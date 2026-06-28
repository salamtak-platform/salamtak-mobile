import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';

class GenderSelector extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String> onChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          SharedLocalizations.of(context)!.inputGenderLabel,
          style: TextStyle(
            fontFamily: "Baloo Bhaijaan 2",
            package: 'ui_kit',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onChanged('male'),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selectedGender == 'male'
                          ? AppColors.patientPrimary
                          : AppColors.naturalLightGray,
                      width: selectedGender == 'male' ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    spacing: 16,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.person,
                        size: 24,
                        color: selectedGender == 'male'
                            ? AppColors.patientPrimary
                            : AppColors.naturalLightGray,
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          SharedLocalizations.of(context)!.inputGenderMale,
                          style: TextStyle(
                            fontFamily: "Baloo Bhaijaan 2",
                            package: 'ui_kit',
                            fontSize: 16,
                            color: selectedGender == 'male'
                                ? AppColors.patientPrimary
                                : AppColors.naturalBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => onChanged('female'),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selectedGender == 'female'
                          ? AppColors.patientPrimary
                          : AppColors.naturalLightGray,
                      width: selectedGender == 'female' ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    spacing: 16,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.personDress,
                        size: 24,
                        color: selectedGender == 'female'
                            ? AppColors.patientPrimary
                            : AppColors.naturalLightGray,
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          SharedLocalizations.of(context)!.inputGenderFemale,
                          style: TextStyle(
                            fontFamily: "Baloo Bhaijaan 2",
                            package: 'ui_kit',
                            fontSize: 16,
                            color: selectedGender == 'female'
                                ? AppColors.patientPrimary
                                : AppColors.naturalBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
