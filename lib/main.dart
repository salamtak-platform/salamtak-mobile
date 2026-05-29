import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salamtak/generated/l10n.dart';
// import 'package:salamtak/screens/continue_with_phone.dart';
// import 'package:salamtak/screens/onboarding_one_screen.dart';
// import 'package:salamtak/screens/preferences_screen.dart';
import 'package:salamtak/views/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

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
  DevicePreview(enabled: !kReleaseMode, builder: (context) => SalamtakApp()),
);

class SalamtakApp extends StatelessWidget {
  const SalamtakApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SplashView(),
    );
  }
}
