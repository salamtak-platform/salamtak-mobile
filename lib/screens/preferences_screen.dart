import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "اختر إعداداتك المفضلة",
            style: TextStyle(
              fontFamily: "Baloo Bhaijaan 2",
              fontSize: 24,
              fontWeight: FontWeight(400),
            ),
          ),
        ],
      ),
    );
  }
}
