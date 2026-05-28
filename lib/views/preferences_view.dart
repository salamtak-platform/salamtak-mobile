import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/components/language_selector.dart';
import 'package:salamtak/components/main_button.dart';
import 'package:salamtak/components/theme_selector.dart';
import 'package:salamtak/generated/l10n.dart';
import 'package:salamtak/views/onboarding_one_view.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).preferencesTitle,
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
              Spacer(flex: 1),
              MainButton(
                title: "تطبيق الإعدادات",
                pushView: OnboardingOneView(),
                status: "primary",
                isLeftIcon: false,
                isRightIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
