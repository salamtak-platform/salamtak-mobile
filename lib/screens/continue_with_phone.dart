import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/assets/app_colors.dart';
import 'package:salamtak/components/language_selector.dart';
import 'package:salamtak/components/main_button.dart';
import 'package:salamtak/components/theme_selector.dart';

class ContinueWithPhone extends StatelessWidget {
  const ContinueWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/patient_logo.png"),
              width: 64,
              height: 56,
            ),
            SizedBox(height: 24),
            Text(
              "انشئ حساب أو سجل الدخول",
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 24,
                fontWeight: FontWeight(500),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "يمكنك المتابعة باستخدام",
              style: TextStyle(
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 16,
                fontWeight: FontWeight(500),
              ),
            ),
            SizedBox(height: 24),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 16,
              children: [
                Text(
                  "رقم المحمول",
                  style: TextStyle(
                    fontFamily: "Baloo Bhaijaan 2",
                    fontSize: 16,
                    fontWeight: FontWeight(500),
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: BoxBorder.all(color: AppColors.naturalDarkGrey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        spacing: 8,
                        children: [
                          Image(
                            image: AssetImage("assets/images/egypt_flag.png"),
                            width: 36,
                            height: 24,
                          ),
                          Text(
                            "+20",
                            style: TextStyle(
                              fontFamily: "Baloo Bhaijaan 2",
                              fontSize: 16,
                              fontWeight: FontWeight(500),
                              color: AppColors.naturalDarkGrey,
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.chevronDown,
                            weight: 24,
                            color: AppColors.naturalDarkGrey,
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: BoxBorder.all(
                            color: AppColors.naturalDarkGrey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          spacing: 16,
                          children: [
                            Text(
                              "مثال: 1234567890",
                              style: TextStyle(
                                fontFamily: "Baloo Bhaijaan 2",
                                fontSize: 14,
                                fontWeight: FontWeight(500),
                                color: AppColors.naturalDarkGrey,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.phoneFlip,
                              weight: 20,
                              color: AppColors.naturalDarkGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            MainButton(
              title: "المتابعة باستخدام رقم الهاتف",
              buttonFunction: () {},
            ),
          ],
        ),
      ),
    );
  }
}
