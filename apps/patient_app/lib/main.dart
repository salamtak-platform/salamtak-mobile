import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/views/continue_with_phone_view.dart';
import 'package:patient_app/features/auth/views/mobile_otp_view.dart';
import 'package:patient_app/src/generated/patient_localizations.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => PatientApp()));
}

class PatientApp extends StatelessWidget {
  const PatientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale('ar'),
        theme: ThemeData(
          fontFamily: "Baloo Bhaijaan 2",
          scaffoldBackgroundColor: AppColors.naturalWhite,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.naturalWhite,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
              fontFamily: "Baloo Bhaijaan 2",
              fontSize: 16,
              fontWeight: FontWeight(500),
              color: AppColors.alertError,
            ),
            filled: true,
            fillColor: AppColors.naturalWhite,
            hoverColor: AppColors.naturalWhite,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.patientPrimary, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.naturalLightGray, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.alertError, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.alertError, width: 2),
            ),
            errorMaxLines: 1,
            errorStyle: TextStyle(
              fontFamily: "Baloo Bhaijaan 2",
              fontSize: 12,
              fontWeight: FontWeight(500),
              color: AppColors.alertError,
            ),
            hintStyle: TextStyle(
              fontFamily: "Baloo Bhaijaan 2",
              fontSize: 14,
              fontWeight: FontWeight(500),
              color: AppColors.naturalDarkGrey,
            ),
            iconColor: AppColors.patientPrimary,
            prefixIconColor: AppColors.naturalLightGray,
            suffixIconColor: AppColors.naturalLightGray,
            prefixIconConstraints: BoxConstraints(minWidth: 24, minHeight: 24),
            suffixIconConstraints: BoxConstraints(minWidth: 24, minHeight: 24),
          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.patientPrimaryLight4,
            selectionHandleColor: AppColors.patientPrimary,
            cursorColor: AppColors.patientPrimary,
          ),
        ),

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
        routes: {
          //   SplashView.id: (context) => SplashView(),
          ContinueWithPhoneView.id: (context) => ContinueWithPhoneView(),
          MobileOtpView.id: (context) => MobileOtpView(),
          //   EmailOtpView.id: (context) => EmailOtpView(),
          // HomeView.id: (context) => HomeView(),
          //   OnboardingOneView.id: (context) => OnboardingOneView(),
          //   OnboardingTwoView.id: (context) => OnboardingTwoView(),
          //   OnboardingThreeView.id: (context) => OnboardingThreeView(),
          //   OnboardingFourView.id: (context) => OnboardingFourView(),
          //   PreferencesView.id: (context) => PreferencesView(),
          // AddEmailView.id: (context) => AddEmailView(),
          //   AddPhoneView.id: (context) => AddPhoneView(),
          //   CreatePasswordView.id: (context) => CreatePasswordView(),
          //   ContinueWithEmailView.id: (context) => ContinueWithEmailView(),
          //   LoginWithEmail.id: (context) => LoginWithEmail(),
          //   LoginWithEmail.id: (context) => LoginWithEmail(),
          //   ResetPasswordView.id: (context) => ResetPasswordView(),
          // CompleteAccount.id: (context) => CompleteAccount(),
          //   TestImageUploadScreen.id: (context) => TestImageUploadScreen(),
          //   TestDateScreen.id: (context) => TestDateScreen(),
        },
        initialRoute: ContinueWithPhoneView.id,
      ),
    );
  }
}
