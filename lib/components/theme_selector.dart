import 'package:flutter/material.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          "المظهر",
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
                height: 140,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: BoxBorder.all(color: Colors.grey),
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage("assets/images/light_theme.png"),
                      ),
                    ),
                    Text(
                      "فاتح",
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
                height: 140,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: BoxBorder.all(color: Colors.grey),
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage("assets/images/dark_theme.png"),
                      ),
                    ),
                    Text(
                      "داكن",
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
                height: 140,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: BoxBorder.all(color: Colors.grey),
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage("assets/images/auto_theme.png"),
                      ),
                    ),
                    Text(
                      "تلقائي",
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
