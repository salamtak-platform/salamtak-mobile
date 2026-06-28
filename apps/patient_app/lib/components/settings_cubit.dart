import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/components/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void changeLanguage(String languageCode) {
    emit(state.copyWith(locale: Locale(languageCode)));
  }

  void changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
