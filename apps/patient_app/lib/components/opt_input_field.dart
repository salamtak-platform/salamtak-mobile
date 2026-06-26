import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:pinput/pinput.dart';

class OtpInputField extends StatelessWidget {
  final Function(String)? onSubmitted;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  static final defaultPinTheme = PinTheme(
    width: 60,
    height: 64,
    textStyle: TextStyle(
        fontFamily: "Baloo Bhaijaan 2",
        fontSize: 48,
        fontWeight: FontWeight(500),
        color: const Color.fromARGB(255, 86, 89, 89)),
    decoration: BoxDecoration(
      color: AppColors.naturalWhite,
      border: Border.all(
        color: AppColors.naturalLightGray2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  static final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: AppColors.patientPrimary, width: 1),
  );
  static final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.patientPrimaryLight4,
      border: Border.all(
        color: AppColors.patientPrimary,
        width: 2,
      ));
  const OtpInputField({
    super.key,
    this.onSubmitted,
    this.onChanged,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        length: 6,
        keyboardType: TextInputType.number,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        onChanged: onChanged,
        onCompleted: onCompleted,
      ),
    );
  }
}
