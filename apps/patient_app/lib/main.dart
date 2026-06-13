import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/src/generated/patient_localizations.dart';
import 'package:patient_app/views/continue_with_phone_view.dart';
import 'package:patient_app/views/home.dart';
import 'package:patient_app/views/mobile_otp_view.dart';
import 'package:patient_app/views/splash_view.dart';
import 'package:patient_app/views/onboarding_one_view.dart';
import 'package:patient_app/views/onboarding_two_view.dart';
import 'package:patient_app/views/onboarding_three_view.dart';
import 'package:patient_app/views/onboarding_four_view.dart';
import 'package:patient_app/views/preferences_view.dart';
// import 'package:patient_app/views/splash_view.dart';

// void main() {
//   runApp(SalamtakApp());
// }

// class IslamicPlayerApp extends StatelessWidget {
//   const IslamicPlayerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
//   }
// }

void main() => runApp(
      DevicePreview(enabled: !kReleaseMode, builder: (context) => PatientApp()),
    );

class PatientApp extends StatelessWidget {
  const PatientApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashView.id: (context) => SplashView(),
        ContinueWithPhoneView.id: (context) => ContinueWithPhoneView(),
        MobileOtpView.id: (context) => MobileOtpView(),
        HomeView.id: (context) => HomeView(),
        OnboardingOneView.id: (context) => OnboardingOneView(),
        OnboardingTwoView.id: (context) => OnboardingTwoView(),
        OnboardingThreeView.id: (context) => OnboardingThreeView(),
        OnboardingFourView.id: (context) => OnboardingFourView(),
        PreferencesView.id: (context) => PreferencesView(),
      },

      locale: Locale('ar'),
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
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: MobileOtpView.id,
    );
  }
}
