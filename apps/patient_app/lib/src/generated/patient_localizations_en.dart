// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'patient_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class PatientLocalizationsEn extends PatientLocalizations {
  PatientLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get prefTitle => 'اختر إعداداتك المفضلة';

  @override
  String get prefLangLabel => 'اللغة';

  @override
  String get prefLangAr => 'العربية';

  @override
  String get prefLangEn => 'الإنجليزية';

  @override
  String get prefThemeLabel => 'المظهر';

  @override
  String get prefThemeAuto => 'تلقائي';

  @override
  String get prefThemeDark => 'داكن';

  @override
  String get prefThemeLight => 'فاتح';

  @override
  String get prefButton => 'تطبيق الإعدادات';

  @override
  String get commonSkip => 'تخطي';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingPrev => 'السابق';

  @override
  String get onboardingOneTitle => 'اختار أفضل وأقرب طبيب بسهولة وفي أسرع وقت!';

  @override
  String get onboardingOneBody =>
      'في دقيقة واحدة تقدر تختار بين آلاف الأطباء في كل التخصصات وتقارن بينهم من حيث الخبرة والسعر وحاجات تانية كتير.';

  @override
  String get onboardingTwoTitle => 'كمل رحلة علاجك بسهولة من غير لف كتير!';

  @override
  String get onboardingTwoBody =>
      'بدوسة زرار تقدر تحجز كل الأشعات والتحاليل وتطلب الأدوية اللي الطبيب كتبهالك في الروشتة مع شركائنا المتميزين.';

  @override
  String get onboardingThreeTitle =>
      'أنسي الورق، ملفاتك الطبية بقت كلها في جيبك!';

  @override
  String get onboardingThreeBody =>
      'كل الروشتات والأشعات والتحاليل وغيرهم هتلاقي منهم نسخة إلكترونية تقدر تشوفها في أي وقت والطبيب يطلع عليهم بكل سهولة.';

  @override
  String get onboardingFourTitle =>
      'مع حكيم AI، هتلاقي إجابات على أسئلتك طوال الـ 24 ساعة!';

  @override
  String get onboardingFourBody =>
      'تقدر تسأل حكيم AI على أي حاجة بخصوص صحتك وهيجاوب عليك إجابات موثوقة 100% من غير ما تحتاج تدور كتير.';

  @override
  String get onboardingGetStarted => 'ابدأ الآن!';

  @override
  String get signinupTitle => 'انشاء حساب أو تسجيل الدخول';

  @override
  String get signinupSubtitle => 'يمكنك المتابعة باستخدام';

  @override
  String get inputPhoneLabel => 'رقم المحمول';

  @override
  String get inputPhoneHint => 'مثال: 1234567890';

  @override
  String get continueWithPhoneButton => 'المتابعة باستخدام رقم الهاتف';

  @override
  String get commonOrLabel => 'أو';

  @override
  String get continueWithEmailButton => 'البريد';

  @override
  String get continueWithFbButton => 'فيسبوك';

  @override
  String get continueWithGoogleButton => 'جوجل';

  @override
  String get continueAsGuestLabel => 'أو التجربة بدون حساب';

  @override
  String get continueAsGuestButton => 'المتابعة كزائر';

  @override
  String get termsPrivacyAgreement =>
      'بالمتابعة، فأنت توافق على شروط الاستخدام و سياسة الخصوصية الخاصة بسلامتك';

  @override
  String get addEmailTitle => 'أضف البريد الإلكتروني';

  @override
  String get addPhoneTitle => 'أضف رقم المحمول';

  @override
  String get continueWithEmailTitle => 'المتابعة باستخدام البريد الإلكتروني';

  @override
  String get inputEmailLabel => 'البريد الإلكتروني';

  @override
  String get inputEmailHint => 'مثال: example@test.com';

  @override
  String get inputFirstNameLabel => 'الاسم الأول';

  @override
  String get inputFirstNameHint => 'مثال: محمد';

  @override
  String get inputLastNameLabel => 'الاسم الأخير';

  @override
  String get inputLastNameHint => 'مثال: عبد الله';

  @override
  String get inputNewPassLabel => 'كلمة السر الجديدة';

  @override
  String get inputConfNewPassLabel => 'تأكيد كلمة السر الجديدة';

  @override
  String get inputPassLabel => 'كلمة السر';

  @override
  String get inputHiddenPassHint => 'مثال: ••••••••••••';

  @override
  String get inputShownPassHint => 'مثال: Pass@12345';

  @override
  String get inputGenderLabel => 'النوع';

  @override
  String get inputGenderFemale => 'أنثي';

  @override
  String get inputGenderMale => 'ذكر';

  @override
  String get inputBirthdateLabel => 'تاريخ الميلاد';

  @override
  String get inputBirthdateHint => 'مثال: 06 / 10 / 1973 ';

  @override
  String get completeAccTitle => 'إكمال بيانات الحساب';

  @override
  String get createAccButton => 'إنشاء حساب جديد';

  @override
  String get verifyPhoneTitle => 'التحقق من رقم المحمول';

  @override
  String verifyPhoneBody(Object phoneNumber) {
    return 'قم بإدخال الرمز المكون من 4 أرقام الذي تم إرساله إلى الرقم: $phoneNumber';
  }

  @override
  String get verifyEmailTitle => 'التحقق من البريد الإلكتروني';

  @override
  String verifyEmailBody(Object email) {
    return 'قم بإدخال الرمز المكون من 4 أرقام الذي تم إرساله إلى البريد الإلكتروني: $email';
  }

  @override
  String resendOtpText(Object seconds) {
    return 'لم تستلم الرمز؟ يمكنك إعادة إرساله خلال: $seconds ثانية';
  }

  @override
  String get verifyOtpButton => 'التحقق من الرمز';

  @override
  String get createNewPassTitle => 'إنشاء كلمة سر جديدة';

  @override
  String get createNewPassButton => 'إنشاء كلمة السر';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get forgotPassButton => 'هل نسيت كلمة السر؟';

  @override
  String get loginButton => 'تسجيل الدخول';
}
