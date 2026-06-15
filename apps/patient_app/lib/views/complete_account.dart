import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/gender_selector.dart';
import 'package:patient_app/components/main_button.dart';
import 'package:patient_app/views/home_view.dart';

class CompleteAccount extends StatelessWidget {
  static String id = "CompleteAccount";

  const CompleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.naturalWhite,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SharedLocalizations.of(context)!.completeAccTitle,
                        style: TextStyle(
                          fontFamily: "Baloo Bhaijaan 2",
                          fontSize: 24,
                          fontWeight: FontWeight(500),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profile_picture.jpeg",
                                        package: "ui_kit"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10000),
                                  border: BoxBorder.all(
                                      color: AppColors.patientPrimary,
                                      width: 4)),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.patientPrimary,
                                    borderRadius: BorderRadius.circular(10000),
                                    border: BoxBorder.all(
                                        color: AppColors.naturalWhite,
                                        width: 2)),
                                child: FaIcon(
                                  FontAwesomeIcons.penToSquare,
                                  size: 18,
                                  color: AppColors.naturalWhite,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                readOnly: false,
                                label: SharedLocalizations.of(context)!
                                    .inputFirstNameLabel,
                                keyboardType: TextInputType.phone,
                                prefixIconName: FontAwesomeIcons.phoneFlip,
                                hint: SharedLocalizations.of(context)!
                                    .inputFirstNameHint,
                                type: CustomTextFieldType.other),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                                readOnly: false,
                                label: SharedLocalizations.of(context)!
                                    .inputLastNameLabel,
                                keyboardType: TextInputType.phone,
                                prefixIconName: FontAwesomeIcons.phoneFlip,
                                hint: SharedLocalizations.of(context)!
                                    .inputLastNameHint,
                                type: CustomTextFieldType.other),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextFormField(
                          readOnly: false,
                          label:
                              SharedLocalizations.of(context)!.inputPhoneLabel,
                          keyboardType: TextInputType.phone,
                          prefixIconName: FontAwesomeIcons.phoneFlip,
                          hint: SharedLocalizations.of(context)!.inputPhoneHint,
                          type: CustomTextFieldType.phone),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextFormField(
                          readOnly: false,
                          label:
                              SharedLocalizations.of(context)!.inputEmailLabel,
                          keyboardType: TextInputType.emailAddress,
                          prefixIconName: FontAwesomeIcons.envelope,
                          hint: SharedLocalizations.of(context)!.inputEmailHint,
                          type: CustomTextFieldType.other),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextFormField(
                          readOnly: false,
                          label:
                              SharedLocalizations.of(context)!.inputPassLabel,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIconName: FontAwesomeIcons.lock,
                          suffixIconName: FontAwesomeIcons.eyeSlash,
                          hint: SharedLocalizations.of(context)!
                              .inputShownPassHint,
                          type: CustomTextFieldType.other),
                      const SizedBox(
                        height: 24,
                      ),
                      GenderSelector(),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextFormField(
                          readOnly: true,
                          label: SharedLocalizations.of(context)!
                              .inputBirthdateLabel,
                          keyboardType: null,
                          prefixIconName: FontAwesomeIcons.calendar,
                          hint: SharedLocalizations.of(context)!
                              .inputBirthdateHint,
                          type: CustomTextFieldType.other),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
              MainButton(
                title: SharedLocalizations.of(context)!.createAccButton,
                status: "primary",
                isLeftIcon: false,
                isRightIcon: false,
                route: HomeView.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
