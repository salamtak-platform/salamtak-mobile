import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
