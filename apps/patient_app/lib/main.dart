import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/src/generated/patient_localizations.dart';

import 'views.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => PatientApp()));
}

class PatientApp extends StatelessWidget {
  const PatientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),

      builder: DevicePreview.appBuilder,
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),

      localizationsDelegates: [
        SharedLocalizations.delegate,
        PatientLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        ...SharedLocalizations.supportedLocales,
        ...PatientLocalizations.supportedLocales,
      ],
      // routes: {
      //   SplashView.id: (context) => SplashView(),
      //   ContinueWithPhoneView.id: (context) => ContinueWithPhoneView(),
      //   MobileOtpView.id: (context) => MobileOtpView(),
      //   EmailOtpView.id: (context) => EmailOtpView(),
      //   HomeView.id: (context) => HomeView(),
      //   OnboardingOneView.id: (context) => OnboardingOneView(),
      //   OnboardingTwoView.id: (context) => OnboardingTwoView(),
      //   OnboardingThreeView.id: (context) => OnboardingThreeView(),
      //   OnboardingFourView.id: (context) => OnboardingFourView(),
      //   PreferencesView.id: (context) => PreferencesView(),
      //   AddEmailView.id: (context) => AddEmailView(),
      //   AddPhoneView.id: (context) => AddPhoneView(),
      //   CreatePasswordView.id: (context) => CreatePasswordView(),
      //   ContinueWithEmailView.id: (context) => ContinueWithEmailView(),
      //   LoginWithEmail.id: (context) => LoginWithEmail(),
      //   LoginWithEmail.id: (context) => LoginWithEmail(),
      //   ResetPasswordView.id: (context) => ResetPasswordView(),
      //   CompleteAccount.id: (context) => CompleteAccount(),
      //   TestImageUploadScreen.id: (context) => TestImageUploadScreen(),
      //   TestDateScreen.id: (context) => TestDateScreen(),
      // },
      home: ContinueWithPhoneView(),
    );
  }
}
