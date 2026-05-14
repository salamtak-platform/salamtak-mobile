import 'package:flutter/material.dart';
// import 'package:salamtak/screens/onboarding_one_screen.dart';
// import 'package:salamtak/screens/preferences_screen.dart';
import 'package:salamtak/screens/splash_screen.dart';
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
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
