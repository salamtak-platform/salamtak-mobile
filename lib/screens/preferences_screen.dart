import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/components/language_selector.dart';
import 'package:salamtak/components/main_button.dart';
import 'package:salamtak/components/theme_selector.dart';
import 'package:salamtak/screens/onboarding_one_screen.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "اختر إعداداتك المفضلة",
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 24,
                fontWeight: FontWeight(500),
              ),
            ),
            SizedBox(height: 24),

            LanguageSelector(),
            SizedBox(height: 24),

            ThemeSelector(),
            SizedBox(height: 80),

            MainButton(
              title: "تطبيق الإعدادات",
              buttonFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OnboardingOneScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
