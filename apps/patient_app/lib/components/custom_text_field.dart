import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/text_styles.dart';

enum CustomTextFieldType { phone, other }

class CustomTextFormField extends StatefulWidget {
  final String label;
  final FaIconData prefixIconName;
  final String hint;
  final FaIconData? suffixIconName;
  final TextInputType? keyboardType;
  final CustomTextFieldType type;
  final bool readOnly;
  final FocusNode? focusNode;
  final FormFieldValidator<String> validator;
  final Function(String) onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool showError;
  final String? errorMessage;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.keyboardType,
    required this.prefixIconName,
    this.suffixIconName,
    required this.hint,
    required this.type,
    required this.readOnly,
    this.focusNode,
    required this.onChanged,
    required this.validator,
    this.inputFormatters,
    this.showError = false,
    this.errorMessage,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          widget.label,
          style: AppTextStyles().bodyMed,
        ),
        Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  focusNode: widget.focusNode,
                  autovalidateMode: AutovalidateMode.disabled,
                  inputFormatters: widget.inputFormatters,
                  validator: widget.validator,
                  style: TextStyle(
                    fontFamily: "Baloo Bhaijaan 2",
                    fontSize: 16,
                    fontWeight: FontWeight(500),
                    color: AppColors.naturalBlack,
                  ),
                  onChanged: widget.onChanged,
                  keyboardType: widget.keyboardType,
                  readOnly: widget.readOnly,
                  decoration: InputDecoration(
                    suffixIcon: widget.suffixIconName != null
                        ? Padding(
                            padding: const EdgeInsetsDirectional.only(end: 16),
                            child: FaIcon(
                              widget.suffixIconName,
                              size: 20,
                            ),
                          )
                        : null,
                    contentPadding: EdgeInsetsDirectional.symmetric(
                        vertical: 0, horizontal: 0),
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16,
                        end: 14,
                      ),
                      child: FaIcon(
                        widget.prefixIconName,
                        size: 20,
                      ),
                    ),
                    hint: Text(
                      widget.hint,
                    ),
                  ),
                ),
                if (widget.showError && widget.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleExclamation,
                          color: AppColors.alertError,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.errorMessage!,
                            style: TextStyle(
                              fontFamily: "Baloo Bhaijaan 2",
                              fontSize: 12,
                              fontWeight: FontWeight(500),
                              color: AppColors.alertError,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            )),
            widget.type == CustomTextFieldType.phone
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
