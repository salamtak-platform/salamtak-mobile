import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/language_selector.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/components/theme_selector.dart';
import 'package:localization/localization.dart';

class PreferencesView extends StatelessWidget {
  static String id = "PreferencesView";
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(backgroundColor: AppColors.naturalWhite, elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SharedLocalizations.of(context)!.prefTitle,
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
              CustomMainButton(
                title: SharedLocalizations.of(context)!.prefButton,
                route: "OnboardingOneView",
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
