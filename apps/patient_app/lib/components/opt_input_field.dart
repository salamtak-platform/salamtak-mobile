import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:pinput/pinput.dart';

class OtpInputField extends StatelessWidget {
  static final defaultPinTheme = PinTheme(
    width: 60,
    height: 64,
    textStyle: TextStyle(
        fontFamily: "Baloo Bhaijaan 2",
        fontSize: 48,
        fontWeight: FontWeight(500),
        color: AppColors.patientPrimary),
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
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        length: 4,
        keyboardType: TextInputType.number,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
      ),
    );
  }
}
