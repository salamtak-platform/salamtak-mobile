import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/views/preferences_view.dart';

class SplashView extends StatefulWidget {
  static String id = "SplashView";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const PreferencesView();
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
