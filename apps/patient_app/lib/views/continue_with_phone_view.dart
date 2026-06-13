import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/main_button.dart';
import 'package:patient_app/views/mobile_otp_view.dart';

class ContinueWithPhoneView extends StatelessWidget {
  const ContinueWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(
        backgroundColor: AppColors.naturalWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                "assets/images/patient_logo.png",
              ),
              width: 64,
              height: 56,
            ),
            SizedBox(height: 24),
            Text(
              "انشئ حساب أو سجل الدخول",
              style: TextStyle(
                package: 'ui_kit',
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 24,
                fontWeight: FontWeight(500),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "يمكنك المتابعة باستخدام",
              style: TextStyle(
                package: 'ui_kit',
                fontFamily: "Baloo Bhaijaan 2",
                fontSize: 16,
                fontWeight: FontWeight(500),
              ),
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  "رقم المحمول",
                  style: TextStyle(
                    package: 'ui_kit',
                    fontFamily: "Baloo Bhaijaan 2",
                    fontSize: 16,
                    fontWeight: FontWeight(500),
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsetsDirectional.symmetric(
                              vertical: 0, horizontal: 0),
                          prefixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 16,
                              end: 14,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.phoneFlip,
                              size: 24,
                            ),
                          ),
                          prefixIconColor: AppColors.naturalDarkGrey,
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 24, minHeight: 24),
                          hint: Text(
                            SharedLocalizations.of(context)!.inputPhoneHint,
                            style: TextStyle(
                              fontFamily: "Baloo Bhaijaan 2",
                              fontSize: 14,
                              fontWeight: FontWeight(500),
                              color: AppColors.naturalDarkGrey,
                            ),
                          ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.naturalDarkGrey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 2,
                              color: AppColors.patientPrimary,
                            ),
                          )),
                    )),
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
                          FaIcon(
                            FontAwesomeIcons.chevronDown,
                            weight: 24,
                            color: AppColors.naturalDarkGrey,
                          ),
                          Text(
                            "+20",
                            style: TextStyle(
                              package: 'ui_kit',
                              fontFamily: "Baloo Bhaijaan 2",
                              fontSize: 16,
                              fontWeight: FontWeight(500),
                              color: AppColors.naturalDarkGrey,
                            ),
                          ),
                          Image(
                            image: AssetImage("assets/images/egypt_flag.png",
                                package: 'ui_kit'),
                            width: 36,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            MainButton(
              status: "primary",
              title: "المتابعة باستخدام رقم الهاتف",
              pushView: MobileOtpView(),
              isLeftIcon: false,
              isRightIcon: false,
            ),
            SizedBox(height: 16),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Divider(height: 1, color: AppColors.naturalLightGray),
                ),
                Text(
                  "أو",
                  style: TextStyle(
                    package: 'ui_kit',
                    fontFamily: "Baloo Bhaijaan 2",
                    fontSize: 16,
                    fontWeight: FontWeight(500),
                  ),
                ),
                Expanded(
                  child: Divider(height: 1, color: AppColors.naturalLightGray),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Row(
                spacing: 8,
                children: [
                  CustomSocialButton(
                    platform: "google",
                  ),
                  CustomSocialButton(
                    platform: "facebook",
                  ),
                  CustomSocialButton(
                    platform: "email",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSocialButton extends StatelessWidget {
  final String platform;

  const CustomSocialButton({
    super.key,
    required this.platform,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: platform == "google"
                ? AppColors.naturalWhite
                : platform == "facebook"
                    ? AppColors.otherFacebookPrimary
                    : AppColors.naturalLightGray,
            border: platform == "google"
                ? BoxBorder.all(
                    color: AppColors.naturalLightGray,
                    width: 1,
                  )
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            platform == "google"
                ? Image.asset(
                    "assets/images/google_icon.png",
                    package: 'ui_kit',
                    width: 24,
                    height: 24,
                  )
                : FaIcon(
                    platform == "facebook"
                        ? FontAwesomeIcons.facebook
                        : FontAwesomeIcons.solidEnvelope,
                    color: AppColors.naturalWhite,
                    size: 24,
                  ),
            Text(
              platform == "google"
                  ? SharedLocalizations.of(context)!.continueWithGoogleButton
                  : platform == "facebook"
                      ? SharedLocalizations.of(context)!.continueWithFbButton
                      : SharedLocalizations.of(context)!
                          .continueWithEmailButton,
              style: TextStyle(
                  fontFamily: "Baloo Bhaijaan 2",
                  fontSize: 16,
                  fontWeight: FontWeight(600),
                  color: platform == "google"
                      ? AppColors.naturalBlack
                      : AppColors.naturalWhite),
            ),
          ],
        ),
      ),
    );
  }
}
