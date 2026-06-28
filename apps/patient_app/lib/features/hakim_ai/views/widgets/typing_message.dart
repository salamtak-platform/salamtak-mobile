import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/features/hakim_ai/views/widgets/hakim_avatar.dart';

class TypingMessage extends StatelessWidget {
  const TypingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'حكيم AI',
              style: _TypingTextStyles.meta,
            ),
            SizedBox(height: 7),
            _TypingBubble(),
          ],
        ),
        const SizedBox(width: 12),
        const HakimAvatar(),
      ],
    );
  }
}

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        color: AppColors.naturalLightGray3,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _TypingDot(),
          _TypingDot(),
          _TypingDot(),
        ],
      ),
    );
  }
}

class _TypingDot extends StatelessWidget {
  const _TypingDot();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.naturalLightGray,
        shape: BoxShape.circle,
      ),
      child: SizedBox(width: 4, height: 4),
    );
  }
}

class _TypingTextStyles {
  static const TextStyle meta = TextStyle(
    color: AppColors.naturalDarkGrey,
    fontFamily: 'Baloo Bhaijaan 2',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1,
    letterSpacing: 0,
  );
}
