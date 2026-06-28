import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';

class Composer extends StatelessWidget {
  const Composer({
    super.key,
    required this.controller,
    required this.onSend,
    required this.enabled,
    required this.isEnglish,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final bool enabled;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 78),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
      decoration: const BoxDecoration(
        color: AppColors.naturalWhite,
        border: Border(
          top: BorderSide(color: AppColors.naturalLightGray3),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: FilledButton(
                onPressed: enabled ? onSend : null,
                style: FilledButton.styleFrom(
                  disabledBackgroundColor: AppColors.patientPrimaryLight3,
                  backgroundColor: AppColors.patientPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: const FaIcon(
                  FontAwesomeIcons.paperPlane,
                  color: AppColors.naturalWhite,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                enabled: enabled,
                minLines: 1,
                maxLines: 4,
                textInputAction: TextInputAction.send,
                textDirection:
                    isEnglish ? TextDirection.ltr : TextDirection.rtl,
                textAlign: isEnglish ? TextAlign.left : TextAlign.right,
                onSubmitted: (_) {
                  if (enabled) onSend();
                },
                style: const TextStyle(
                  color: AppColors.naturalBlack,
                  fontFamily: 'Baloo Bhaijaan 2',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                  letterSpacing: 0,
                ),
                decoration: InputDecoration(
                  hintText: isEnglish ? 'Ask Hakim AI' : 'Ask Hakim AI',
                  hintTextDirection:
                      isEnglish ? TextDirection.ltr : TextDirection.rtl,
                  hintStyle: const TextStyle(
                    color: AppColors.naturalLightGray,
                    fontFamily: 'Baloo Bhaijaan 2',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: 0,
                  ),
                  filled: true,
                  fillColor: enabled
                      ? AppColors.naturalWhite
                      : AppColors.naturalLightGray3,
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.naturalLightGray2,
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.naturalLightGray2,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.patientPrimary,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
