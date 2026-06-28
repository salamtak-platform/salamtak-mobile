import 'package:flutter/material.dart';

class SettingsState {
  const SettingsState({
    this.locale = const Locale('ar'),
    this.themeMode = ThemeMode.system,
  });

  final Locale locale;
  final ThemeMode themeMode;

  SettingsState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
