import 'package:flutter/material.dart';

class FigmaColors {
  const FigmaColors();

  static const Color transparentBG = Color(0x800a0a0a);
  static const Color primaryPatientPrimaryDark2 = Color(0xff00433c);
  static const Color primaryPatientPrimaryDark1 = Color(0xff00655a);
  static const Color primaryPatientPrimary = Color(0xff00a896);
  static const Color primaryPatientPrimaryLight = Color(0xff33b9ab);
  static const Color primaryPatientPrimaryLight2 = Color(0xff66cbc0);
  static const Color primaryPatientPrimaryLight3 = Color(0xff99dcd5);
  static const Color primaryPatientPrimaryLight4 = Color(0xffcceeea);
  static const Color primaryDoctorPrimaryDoctor = Color(0xff008678);
  static const Color primaryDoctorPrimaryLight1 = Color(0xff339e93);
  static const Color primaryDoctorPrimaryLight2 = Color(0xff66b6ae);
  static const Color primaryDoctorPrimaryLight3 = Color(0xff99cfc9);
  static const Color primaryDoctorPrimaryLight4 = Color(0xffcce7e4);
  static const Color naturalWhite = Color(0xfffafffe);
  static const Color naturalLightGray3 = Color(0xfff5f5f5);
  static const Color naturalLightGray2 = Color(0xffcccccc);
  static const Color naturalLightGray = Color(0xff999999);
  static const Color naturalDarkGrey = Color(0xff666666);
  static const Color naturalBlack = Color(0xff000f0f);
  static const Color alertSuccessLight = Color(0xffe6fffc);
  static const Color alertSuccess = Color(0xff00c2a8);
  static const Color alertSuccessDark = Color(0xff21a694);
  static const Color alertWarningLight = Color(0xfffff7e5);
  static const Color alertWarning = Color(0xffffc233);
  static const Color alertWarningDark = Color(0xffa67e21);
  static const Color alertErrorLight = Color(0xffffe5e5);
  static const Color alertError = Color(0xffff4d4d);
  static const Color alertErrorDark = Color(0xffa62121);
  static const Color alertInformationLight = Color(0xffe6f8ff);
  static const Color alertInformation = Color(0xff33c8ff);
  static const Color alertInformationDark = Color(0xff2182a6);
  static const Color otherFacebookPrimary = Color(0xff1877f2);
  static const Color otherComponent = Color(0xff7b61ff);
}

class FigmaTextStyles {
  const FigmaTextStyles();

  TextStyle get mobileHeadersHeaderM => const TextStyle(
    fontSize: 24,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 36 / 24,
    letterSpacing: 0,
  );

  TextStyle get mobileHeadersHeaderSB => const TextStyle(
    fontSize: 24,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-SemiBold',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 36 / 24,
    letterSpacing: 0,
  );

  TextStyle get mobileHeadersSubHeaderM => const TextStyle(
    fontSize: 22,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 33 / 22,
    letterSpacing: 0,
  );

  TextStyle get mobileHeadersSubHeaderR => const TextStyle(
    fontSize: 22,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 33 / 22,
    letterSpacing: 0,
  );

  TextStyle get mobileHeadersTitleM => const TextStyle(
    fontSize: 20,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 30 / 20,
    letterSpacing: 0,
  );

  TextStyle get mobileHeadersTitleR => const TextStyle(
    fontSize: 20,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 30 / 20,
    letterSpacing: 0,
  );

  TextStyle get mobileBodyBodyM => const TextStyle(
    fontSize: 16,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    letterSpacing: 0,
  );

  TextStyle get mobileBodyBodyR => const TextStyle(
    fontSize: 16,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: 0,
  );

  TextStyle get mobileBodyBody2R => const TextStyle(
    fontSize: 15,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 22.5 / 15,
    letterSpacing: 0,
  );

  TextStyle get mobileBodySubBodyR => const TextStyle(
    fontSize: 14,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 21 / 14,
    letterSpacing: 0,
  );

  TextStyle get mobileBodySubBodyM => const TextStyle(
    fontSize: 13,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 19.5 / 13,
    letterSpacing: 0,
  );

  TextStyle get mobileBodyNavbar => const TextStyle(
    fontSize: 12,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Medium',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 18 / 12,
    letterSpacing: 0,
  );

  TextStyle get desktopH1desktop => const TextStyle(
    fontSize: 48,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Bold',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 52.8 / 48,
    letterSpacing: 0,
  );

  TextStyle get desktopH2desktop => const TextStyle(
    fontSize: 35,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Bold',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 45.49 / 35,
    letterSpacing: 0,
  );

  TextStyle get desktopH3desktop => const TextStyle(
    fontSize: 28,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Bold',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 36.39 / 28,
    letterSpacing: 0,
  );

  TextStyle get desktopp1desktop => const TextStyle(
    fontSize: 21,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 27.29 / 21,
    letterSpacing: 0,
  );

  TextStyle get desktopp2desktop => const TextStyle(
    fontSize: 17.5,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 22.74 / 17.5,
    letterSpacing: 0,
  );

  TextStyle get desktopp3desktop => const TextStyle(
    fontSize: 14,
    decoration: TextDecoration.none,
    fontFamily: 'BalooBhaijaan2-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 18.19 / 14,
    letterSpacing: 0,
  );
}
