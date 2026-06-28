import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({
    super.key,
    required this.time,
    required this.message,
    this.maxWidthFactor = .76,
  });

  final String time;
  final String message;
  final double maxWidthFactor;

  @override
  Widget build(BuildContext context) {
    final textDirection =
        _containsArabic(message) ? TextDirection.rtl : TextDirection.ltr;

    return Align(
      alignment: Alignment.centerRight,
      child: FractionallySizedBox(
        widthFactor: maxWidthFactor,
        child: Directionality(
          textDirection: textDirection,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Text('أنت', style: _UserMessageTextStyles.meta),
                  const Spacer(),
                  Text(time, style: _UserMessageTextStyles.meta),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.fromLTRB(13, 9, 13, 10),
                decoration: const BoxDecoration(
                  color: AppColors.patientPrimary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  message,
                  textAlign: textDirection == TextDirection.rtl
                      ? TextAlign.right
                      : TextAlign.left,
                  style: _UserMessageTextStyles.message,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _containsArabic(String value) {
    return RegExp(r'[\u0600-\u06FF]').hasMatch(value);
  }
}

class _UserMessageTextStyles {
  static const TextStyle meta = TextStyle(
    color: AppColors.naturalDarkGrey,
    fontFamily: 'Baloo Bhaijaan 2',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1,
    letterSpacing: 0,
  );

  static const TextStyle message = TextStyle(
    color: AppColors.naturalWhite,
    fontFamily: 'Baloo Bhaijaan 2',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.15,
    letterSpacing: 0,
  );
}
