import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          "اللغة",
          style: TextStyle(
            fontFamily: "Baloo Bhaijaan 2",
            fontSize: 16,
            fontWeight: FontWeight(500),
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: BoxBorder.all(color: Colors.grey),
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Image(
                      image: AssetImage("assets/images/usa_flag.png"),
                      width: 120,
                      height: 80,
                    ),
                    Text(
                      "English",
                      style: TextStyle(
                        fontFamily: "Baloo Bhaijaan 2",
                        fontSize: 16,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: BoxBorder.all(color: Colors.grey),
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Image(
                      image: AssetImage("assets/images/egypt_flag.png"),
                      width: 120,
                      height: 80,
                    ),
                    Text(
                      "العربية",
                      style: TextStyle(
                        fontFamily: "Baloo Bhaijaan 2",
                        fontSize: 16,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
