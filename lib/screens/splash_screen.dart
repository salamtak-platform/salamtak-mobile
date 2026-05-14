import 'package:flutter/material.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/screens/preferences_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const PreferencesScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.naturalWhite,
      body: Center(
        child: Image(
          image: AssetImage("assets/images/patient_logo.png"),
          width: 200,
          height: 175,
        ),
      ),
    );
  }
}
