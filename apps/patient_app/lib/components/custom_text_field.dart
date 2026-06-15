import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';

enum CustomTextFieldType { phone, other }

class CustomTextFormField extends StatelessWidget {
  final String label;
  final FaIconData prefixIconName;
  final String hint;
  final FaIconData? suffixIconName;
  final TextInputType? keyboardType;
  final CustomTextFieldType type;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.keyboardType,
    required this.prefixIconName,
    this.suffixIconName,
    required this.hint,
    required this.type,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          label,
          style: TextStyle(
            package: 'ui_kit',
            fontFamily: "Baloo Bhaijaan 2",
            fontSize: 16,
            fontWeight: FontWeight(500),
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
                child: TextFormField(
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 16,
                fontWeight: FontWeight(500),
                color: AppColors.naturalBlack,
              ),
              keyboardType: keyboardType,
              readOnly: readOnly,
              decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      vertical: 0, horizontal: 0),
                  prefixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 16,
                      end: 14,
                    ),
                    child: FaIcon(
                      prefixIconName,
                      size: 20,
                    ),
                  ),
                  suffixIcon: suffixIconName != null
                      ? Padding(
                          padding: const EdgeInsetsDirectional.only(end: 16),
                          child: FaIcon(
                            suffixIconName,
                            size: 20,
                          ),
                        )
                      : null,
                  prefixIconColor: AppColors.naturalLightGray,
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 24, minHeight: 24),
                  suffixIconColor: AppColors.naturalLightGray,
                  suffixIconConstraints:
                      const BoxConstraints(minWidth: 24, minHeight: 24),
                  hint: Text(
                    hint,
                    style: TextStyle(
                      fontFamily: "Baloo Bhaijaan 2",
                      fontSize: 14,
                      fontWeight: FontWeight(500),
                      color: AppColors.naturalDarkGrey,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.naturalLightGray,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 2,
                      color: AppColors.patientPrimary,
                    ),
                  )),
            )),
            type == CustomTextFieldType.phone
                ? Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: BoxBorder.all(color: AppColors.naturalDarkGrey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 8,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.chevronDown,
                          weight: 24,
                          color: AppColors.naturalDarkGrey,
                        ),
                        Text(
                          "+20",
                          style: TextStyle(
                            package: 'ui_kit',
                            fontFamily: "Baloo Bhaijaan 2",
                            fontSize: 16,
                            fontWeight: FontWeight(500),
                            color: AppColors.naturalDarkGrey,
                          ),
                        ),
                        Image(
                          image: AssetImage("assets/images/egypt_flag.png",
                              package: 'ui_kit'),
                          width: 36,
                          height: 24,
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
