import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/features/hakim_ai/views/widgets/hakim_avatar.dart';

class BotMessage extends StatelessWidget {
  const BotMessage({
    super.key,
    required this.time,
    required this.message,
  });

  final String time;
  final String message;

  @override
  Widget build(BuildContext context) {
    final textDirection =
        _containsArabic(message) ? TextDirection.rtl : TextDirection.ltr;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Directionality(
            textDirection: textDirection,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      time,
                      style: _MessageTextStyles.meta,
                    ),
                    const Spacer(),
                    const Text(
                      'حكيم AI',
                      style: _MessageTextStyles.meta,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 12),
                  decoration: const BoxDecoration(
                    color: AppColors.naturalLightGray3,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: MarkdownBody(
                    data: message,
                    selectable: true,
                    styleSheet: _MessageTextStyles.markdown,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        HakimAvatar(),
      ],
    );
  }

  bool _containsArabic(String value) {
    return RegExp(r'[\u0600-\u06FF]').hasMatch(value);
  }
}

class _MessageTextStyles {
  static final MarkdownStyleSheet markdown = MarkdownStyleSheet(
    p: message,
    strong: message.copyWith(fontWeight: FontWeight.w600),
    em: message.copyWith(fontStyle: FontStyle.italic),
    h1: message.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
    h2: message.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
    h3: message.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
    blockquote: message,
    blockquoteDecoration: const BoxDecoration(
      border: Border(
        right: BorderSide(
          color: AppColors.patientPrimary,
          width: 4,
        ),
      ),
    ),
    code: message.copyWith(
      color: AppColors.naturalBlack,
      backgroundColor: AppColors.naturalLightGray2,
      fontFamily: 'monospace',
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    codeblockPadding: const EdgeInsets.all(10),
    codeblockDecoration: BoxDecoration(
      color: AppColors.naturalLightGray2,
      borderRadius: BorderRadius.circular(6),
    ),
    listBullet: message,
    tableBody: message.copyWith(fontSize: 16),
    tableHead: message.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
    horizontalRuleDecoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: AppColors.naturalDarkGrey),
      ),
    ),
    a: message.copyWith(
      color: AppColors.patientPrimary,
      decoration: TextDecoration.underline,
    ),
  );

  static const TextStyle meta = TextStyle(
    color: AppColors.naturalDarkGrey,
    fontFamily: 'Baloo Bhaijaan 2',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1,
    letterSpacing: 0,
  );

  static const TextStyle message = TextStyle(
    color: AppColors.naturalBlack,
    fontFamily: 'Baloo Bhaijaan 2',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.34,
    letterSpacing: 0,
  );
}
