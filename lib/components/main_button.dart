import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Expanded(
        child: Container(
          height: 48,

          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              "تطبيق الإعدادات",
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 20,
                fontWeight: FontWeight(500),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
