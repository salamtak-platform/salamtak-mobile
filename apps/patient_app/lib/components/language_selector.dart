import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final ValueChanged<String> onLanguageChanged;

  const LanguageSelector({
    super.key,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'اللغة',
          style: const TextStyle(
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
              child: _LanguageOption(
                label: 'English',
                imagePath: 'assets/images/usa_flag.png',
                onTap: () => onLanguageChanged('en'),
              ),
            ),
            Expanded(
              child: _LanguageOption(
                label: 'العربية',
                imagePath: 'assets/images/egypt_flag.png',
                onTap: () => onLanguageChanged('ar'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.imagePath,
    required this.onTap,
  });

  final String label;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          spacing: 16,
          children: [
            Image.asset(
              imagePath,
              package: 'ui_kit',
              width: 120,
              height: 80,
            ),
            Text(
              label,
              style: const TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                package: 'ui_kit',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
