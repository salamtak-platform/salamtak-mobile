import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'patient_localizations_ar.dart';
import 'patient_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of PatientLocalizations
/// returned by `PatientLocalizations.of(context)`.
///
/// Applications need to include `PatientLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/patient_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: PatientLocalizations.localizationsDelegates,
///   supportedLocales: PatientLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the PatientLocalizations.supportedLocales
/// property.
abstract class PatientLocalizations {
  PatientLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static PatientLocalizations? of(BuildContext context) {
    return Localizations.of<PatientLocalizations>(
        context, PatientLocalizations);
  }

  static const LocalizationsDelegate<PatientLocalizations> delegate =
      _PatientLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @prefTitle.
  ///
  /// In en, this message translates to:
  /// **'اختر إعداداتك المفضلة'**
  String get prefTitle;

  /// No description provided for @prefLangLabel.
  ///
  /// In en, this message translates to:
  /// **'اللغة'**
  String get prefLangLabel;

  /// No description provided for @prefLangAr.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get prefLangAr;

  /// No description provided for @prefLangEn.
  ///
  /// In en, this message translates to:
  /// **'الإنجليزية'**
  String get prefLangEn;

  /// No description provided for @prefThemeLabel.
  ///
  /// In en, this message translates to:
  /// **'المظهر'**
  String get prefThemeLabel;

  /// No description provided for @prefThemeAuto.
  ///
  /// In en, this message translates to:
  /// **'تلقائي'**
  String get prefThemeAuto;

  /// No description provided for @prefThemeDark.
  ///
  /// In en, this message translates to:
  /// **'داكن'**
  String get prefThemeDark;

  /// No description provided for @prefThemeLight.
  ///
  /// In en, this message translates to:
  /// **'فاتح'**
  String get prefThemeLight;

  /// No description provided for @prefButton.
  ///
  /// In en, this message translates to:
  /// **'تطبيق الإعدادات'**
  String get prefButton;

  /// No description provided for @commonSkip.
  ///
  /// In en, this message translates to:
  /// **'تخطي'**
  String get commonSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'التالي'**
  String get onboardingNext;

  /// No description provided for @onboardingPrev.
  ///
  /// In en, this message translates to:
  /// **'السابق'**
  String get onboardingPrev;

  /// No description provided for @onboardingOneTitle.
  ///
  /// In en, this message translates to:
  /// **'اختار أفضل وأقرب طبيب بسهولة وفي أسرع وقت!'**
  String get onboardingOneTitle;

  /// No description provided for @onboardingOneBody.
  ///
  /// In en, this message translates to:
  /// **'في دقيقة واحدة تقدر تختار بين آلاف الأطباء في كل التخصصات وتقارن بينهم من حيث الخبرة والسعر وحاجات تانية كتير.'**
  String get onboardingOneBody;

  /// No description provided for @onboardingTwoTitle.
  ///
  /// In en, this message translates to:
  /// **'كمل رحلة علاجك بسهولة من غير لف كتير!'**
  String get onboardingTwoTitle;

  /// No description provided for @onboardingTwoBody.
  ///
  /// In en, this message translates to:
  /// **'بدوسة زرار تقدر تحجز كل الأشعات والتحاليل وتطلب الأدوية اللي الطبيب كتبهالك في الروشتة مع شركائنا المتميزين.'**
  String get onboardingTwoBody;

  /// No description provided for @onboardingThreeTitle.
  ///
  /// In en, this message translates to:
  /// **'أنسي الورق، ملفاتك الطبية بقت كلها في جيبك!'**
  String get onboardingThreeTitle;

  /// No description provided for @onboardingThreeBody.
  ///
  /// In en, this message translates to:
  /// **'كل الروشتات والأشعات والتحاليل وغيرهم هتلاقي منهم نسخة إلكترونية تقدر تشوفها في أي وقت والطبيب يطلع عليهم بكل سهولة.'**
  String get onboardingThreeBody;

  /// No description provided for @onboardingFourTitle.
  ///
  /// In en, this message translates to:
  /// **'مع حكيم AI، هتلاقي إجابات على أسئلتك طوال الـ 24 ساعة!'**
  String get onboardingFourTitle;

  /// No description provided for @onboardingFourBody.
  ///
  /// In en, this message translates to:
  /// **'تقدر تسأل حكيم AI على أي حاجة بخصوص صحتك وهيجاوب عليك إجابات موثوقة 100% من غير ما تحتاج تدور كتير.'**
  String get onboardingFourBody;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'ابدأ الآن!'**
  String get onboardingGetStarted;

  /// No description provided for @signinupTitle.
  ///
  /// In en, this message translates to:
  /// **'انشاء حساب أو تسجيل الدخول'**
  String get signinupTitle;

  /// No description provided for @signinupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'يمكنك المتابعة باستخدام'**
  String get signinupSubtitle;

  /// No description provided for @inputPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'رقم المحمول'**
  String get inputPhoneLabel;

  /// No description provided for @inputPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'مثال: 1234567890'**
  String get inputPhoneHint;

  /// No description provided for @continueWithPhoneButton.
  ///
  /// In en, this message translates to:
  /// **'المتابعة باستخدام رقم الهاتف'**
  String get continueWithPhoneButton;

  /// No description provided for @commonOrLabel.
  ///
  /// In en, this message translates to:
  /// **'أو'**
  String get commonOrLabel;

  /// No description provided for @continueWithEmailButton.
  ///
  /// In en, this message translates to:
  /// **'البريد'**
  String get continueWithEmailButton;

  /// No description provided for @continueWithFbButton.
  ///
  /// In en, this message translates to:
  /// **'فيسبوك'**
  String get continueWithFbButton;

  /// No description provided for @continueWithGoogleButton.
  ///
  /// In en, this message translates to:
  /// **'جوجل'**
  String get continueWithGoogleButton;

  /// No description provided for @continueAsGuestLabel.
  ///
  /// In en, this message translates to:
  /// **'أو التجربة بدون حساب'**
  String get continueAsGuestLabel;

  /// No description provided for @continueAsGuestButton.
  ///
  /// In en, this message translates to:
  /// **'المتابعة كزائر'**
  String get continueAsGuestButton;

  /// No description provided for @termsPrivacyAgreement.
  ///
  /// In en, this message translates to:
  /// **'بالمتابعة، فأنت توافق على شروط الاستخدام و سياسة الخصوصية الخاصة بسلامتك'**
  String get termsPrivacyAgreement;

  /// No description provided for @addEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'أضف البريد الإلكتروني'**
  String get addEmailTitle;

  /// No description provided for @addPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'أضف رقم المحمول'**
  String get addPhoneTitle;

  /// No description provided for @continueWithEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'المتابعة باستخدام البريد الإلكتروني'**
  String get continueWithEmailTitle;

  /// No description provided for @inputEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'البريد الإلكتروني'**
  String get inputEmailLabel;

  /// No description provided for @inputEmailHint.
  ///
  /// In en, this message translates to:
  /// **'مثال: example@test.com'**
  String get inputEmailHint;

  /// No description provided for @inputFirstNameLabel.
  ///
  /// In en, this message translates to:
  /// **'الاسم الأول'**
  String get inputFirstNameLabel;

  /// No description provided for @inputFirstNameHint.
  ///
  /// In en, this message translates to:
  /// **'مثال: محمد'**
  String get inputFirstNameHint;

  /// No description provided for @inputLastNameLabel.
  ///
  /// In en, this message translates to:
  /// **'الاسم الأخير'**
  String get inputLastNameLabel;

  /// No description provided for @inputLastNameHint.
  ///
  /// In en, this message translates to:
  /// **'مثال: عبد الله'**
  String get inputLastNameHint;

  /// No description provided for @inputNewPassLabel.
  ///
  /// In en, this message translates to:
  /// **'كلمة السر الجديدة'**
  String get inputNewPassLabel;

  /// No description provided for @inputConfNewPassLabel.
  ///
  /// In en, this message translates to:
  /// **'تأكيد كلمة السر الجديدة'**
  String get inputConfNewPassLabel;

  /// No description provided for @inputPassLabel.
  ///
  /// In en, this message translates to:
  /// **'كلمة السر'**
  String get inputPassLabel;

  /// No description provided for @inputHiddenPassHint.
  ///
  /// In en, this message translates to:
  /// **'مثال: ••••••••••••'**
  String get inputHiddenPassHint;

  /// No description provided for @inputShownPassHint.
  ///
  /// In en, this message translates to:
  /// **'مثال: Pass@12345'**
  String get inputShownPassHint;

  /// No description provided for @inputGenderLabel.
  ///
  /// In en, this message translates to:
  /// **'النوع'**
  String get inputGenderLabel;

  /// No description provided for @inputGenderFemale.
  ///
  /// In en, this message translates to:
  /// **'أنثي'**
  String get inputGenderFemale;

  /// No description provided for @inputGenderMale.
  ///
  /// In en, this message translates to:
  /// **'ذكر'**
  String get inputGenderMale;

  /// No description provided for @inputBirthdateLabel.
  ///
  /// In en, this message translates to:
  /// **'تاريخ الميلاد'**
  String get inputBirthdateLabel;

  /// No description provided for @inputBirthdateHint.
  ///
  /// In en, this message translates to:
  /// **'مثال: 06 / 10 / 1973 '**
  String get inputBirthdateHint;

  /// No description provided for @completeAccTitle.
  ///
  /// In en, this message translates to:
  /// **'إكمال بيانات الحساب'**
  String get completeAccTitle;

  /// No description provided for @createAccButton.
  ///
  /// In en, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get createAccButton;

  /// No description provided for @verifyPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'التحقق من رقم المحمول'**
  String get verifyPhoneTitle;

  /// No description provided for @verifyPhoneBody.
  ///
  /// In en, this message translates to:
  /// **'قم بإدخال الرمز المكون من 6 أرقام الذي تم إرساله إلى الرقم: {phoneNumber}'**
  String verifyPhoneBody(Object phoneNumber);

  /// No description provided for @verifyEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'التحقق من البريد الإلكتروني'**
  String get verifyEmailTitle;

  /// No description provided for @verifyEmailBody.
  ///
  /// In en, this message translates to:
  /// **'قم بإدخال الرمز المكون من 4 أرقام الذي تم إرساله إلى البريد الإلكتروني: {email}'**
  String verifyEmailBody(Object email);

  /// No description provided for @resendOtpText.
  ///
  /// In en, this message translates to:
  /// **'لم تستلم الرمز؟ يمكنك إعادة إرساله خلال: {seconds} ثانية'**
  String resendOtpText(Object seconds);

  /// No description provided for @verifyOtpButton.
  ///
  /// In en, this message translates to:
  /// **'التحقق من الرمز'**
  String get verifyOtpButton;

  /// No description provided for @createNewPassTitle.
  ///
  /// In en, this message translates to:
  /// **'إنشاء كلمة سر جديدة'**
  String get createNewPassTitle;

  /// No description provided for @createNewPassButton.
  ///
  /// In en, this message translates to:
  /// **'إنشاء كلمة السر'**
  String get createNewPassButton;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'تسجيل الدخول'**
  String get loginTitle;

  /// No description provided for @forgotPassButton.
  ///
  /// In en, this message translates to:
  /// **'هل نسيت كلمة السر؟'**
  String get forgotPassButton;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'تسجيل الدخول'**
  String get loginButton;
}

class _PatientLocalizationsDelegate
    extends LocalizationsDelegate<PatientLocalizations> {
  const _PatientLocalizationsDelegate();

  @override
  Future<PatientLocalizations> load(Locale locale) {
    return SynchronousFuture<PatientLocalizations>(
        lookupPatientLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_PatientLocalizationsDelegate old) => false;
}

PatientLocalizations lookupPatientLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return PatientLocalizationsAr();
    case 'en':
      return PatientLocalizationsEn();
  }

  throw FlutterError(
      'PatientLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
