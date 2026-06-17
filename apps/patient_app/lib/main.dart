import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/src/generated/patient_localizations.dart';
import 'package:patient_app/views/add_email_view.dart';
import 'package:patient_app/views/add_phone_view.dart';
import 'package:patient_app/views/complete_account.dart';
import 'package:patient_app/views/continue_with_email_view.dart';
import 'package:patient_app/views/continue_with_phone_view.dart';
import 'package:patient_app/views/create_password_view.dart';
import 'package:patient_app/views/test_date_screen.dart';
import 'package:patient_app/views/email_otp_view.dart';
import 'package:patient_app/views/home_view.dart';
import 'package:patient_app/views/test_image_upload_screen.dart';
import 'package:patient_app/views/mobile_otp_view.dart';
import 'package:patient_app/views/login_with_email.dart';
import 'package:patient_app/views/reset_password_view.dart';
import 'package:patient_app/views/splash_view.dart';
import 'package:patient_app/views/onboarding_one_view.dart';
import 'package:patient_app/views/onboarding_two_view.dart';
import 'package:patient_app/views/onboarding_three_view.dart';
import 'package:patient_app/views/onboarding_four_view.dart';
import 'package:patient_app/views/preferences_view.dart';

// void main() {
//   runApp(PatientApp());
// }

// class PatientApp extends StatelessWidget {
//   const PatientApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       locale: Locale('ar'),
//       localizationsDelegates: [
//         SharedLocalizations.delegate,
//         PatientLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [
//         ...SharedLocalizations.supportedLocales,
//         ...PatientLocalizations.supportedLocales,
//       ],
//       routes: {
//         SplashView.id: (context) => SplashView(),
//         ContinueWithPhoneView.id: (context) => ContinueWithPhoneView(),
//         MobileOtpView.id: (context) => MobileOtpView(),
//         EmailOtpView.id: (context) => EmailOtpView(),
//         HomeView.id: (context) => HomeView(),
//         OnboardingOneView.id: (context) => OnboardingOneView(),
//         OnboardingTwoView.id: (context) => OnboardingTwoView(),
//         OnboardingThreeView.id: (context) => OnboardingThreeView(),
//         OnboardingFourView.id: (context) => OnboardingFourView(),
//         PreferencesView.id: (context) => PreferencesView(),
//         AddEmailView.id: (context) => AddEmailView(),
//         AddPhoneView.id: (context) => AddPhoneView(),
//         CreatePasswordView.id: (context) => CreatePasswordView(),
//         ContinueWithEmailView.id: (context) => ContinueWithEmailView(),
//         LoginWithEmail.id: (context) => LoginWithEmail(),
//         LoginWithEmail.id: (context) => LoginWithEmail(),
//         ResetPasswordView.id: (context) => ResetPasswordView(),
//         CompleteAccount.id: (context) => CompleteAccount(),
//         ImageUploadScreen.id: (context) => ImageUploadScreen(),
//       },
//       initialRoute: CompleteAccount.id,
//     );
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
        EmailOtpView.id: (context) => EmailOtpView(),
        HomeView.id: (context) => HomeView(),
        OnboardingOneView.id: (context) => OnboardingOneView(),
        OnboardingTwoView.id: (context) => OnboardingTwoView(),
        OnboardingThreeView.id: (context) => OnboardingThreeView(),
        OnboardingFourView.id: (context) => OnboardingFourView(),
        PreferencesView.id: (context) => PreferencesView(),
        AddEmailView.id: (context) => AddEmailView(),
        AddPhoneView.id: (context) => AddPhoneView(),
        CreatePasswordView.id: (context) => CreatePasswordView(),
        ContinueWithEmailView.id: (context) => ContinueWithEmailView(),
        LoginWithEmail.id: (context) => LoginWithEmail(),
        LoginWithEmail.id: (context) => LoginWithEmail(),
        ResetPasswordView.id: (context) => ResetPasswordView(),
        CompleteAccount.id: (context) => CompleteAccount(),
        TestImageUploadScreen.id: (context) => TestImageUploadScreen(),
        TestDateScreen.id: (context) => TestDateScreen(),
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
      initialRoute: PreferencesView.id,
    );
  }
}
