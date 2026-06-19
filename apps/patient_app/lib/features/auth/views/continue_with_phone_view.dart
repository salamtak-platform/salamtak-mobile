import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_labeled_divider.dart';
import 'package:patient_app/components/custom_social_button.dart';
import 'package:patient_app/components/custom_terms_privacy_notice.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/custom_main_button.dart';

enum CountryCodes { plus20 }

class ContinueWithPhoneView extends StatefulWidget {
  static String id = "ContinueWithPhoneView";

  const ContinueWithPhoneView({super.key});

  @override
  State<ContinueWithPhoneView> createState() => _ContinueWithPhoneViewState();
}

class _ContinueWithPhoneViewState extends State<ContinueWithPhoneView> {
  String? phoneNumber;
  String? countryCode;
  bool showError = false;
  String? errorMessage;
  late FocusNode phoneFocusNode;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    phoneFocusNode = FocusNode();
    phoneFocusNode.addListener(() {
      if (!phoneFocusNode.hasFocus) {
        final message = _validatePhone(phoneNumber);
        setState(() {
          showError = message != null;
          errorMessage = message;
        });
      }
    });
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }

  String? _validatePhone(String? data) {
    if (data == null || data.isEmpty) {
      return "هذا الحقل مطلوب";
    }
    if (data.length != 10 && data.length != 11) {
      return "رقم الهاتف يجب ألا يقل عن 10 أرقام";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.naturalWhite,
      appBar: AppBar(
        backgroundColor: AppColors.naturalWhite,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  CustomTextFormField(
                    readOnly: false,
                    label: SharedLocalizations.of(context)!.inputPhoneLabel,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    prefixIconName: FontAwesomeIcons.phoneFlip,
                    hint: SharedLocalizations.of(context)!.inputPhoneHint,
                    type: CustomTextFieldType.phone,
                    showError: showError,
                    errorMessage: errorMessage,
                    focusNode: phoneFocusNode,
                    onChanged: (data) {
                      setState(() {
                        if (data.startsWith("0")) {
                          phoneNumber = data.substring(1);
                        } else {
                          phoneNumber = data;
                        }
                        showError = false;
                        errorMessage = null;
                      });
                    },
                    validator: _validatePhone,
                  ),
                  SizedBox(height: 32),
                  CustomMainButton(
                      title: SharedLocalizations.of(context)!
                          .continueWithPhoneButton,
                      state: MainButtonStates.enabled,
                      isLeftIcon: false,
                      isRightIcon: false,
                      onPressed: () {
                        // final message = _validatePhone(phoneNumber);
                        // setState(() {
                        //   showError = message != null;
                        //   errorMessage = message;
                        // });

                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "continue with phone $phoneNumber Button pressed")),
                          );
                        }
                      },
                      style: MainButtonStyles.primary),
                  SizedBox(height: 24),
                  CustomLabeledDivider(
                      label: SharedLocalizations.of(context)!.commonOrLabel),
                  SizedBox(height: 24),
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
                  SizedBox(height: 24),
                  CustomLabeledDivider(
                      label: SharedLocalizations.of(context)!
                          .continueAsGuestLabel),
                  SizedBox(height: 24),
                  CustomMainButton(
                      title: SharedLocalizations.of(context)!
                          .continueAsGuestButton,
                      state: MainButtonStates.enabled,
                      isLeftIcon: false,
                      isRightIcon: false,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('continueAsGuestButton pressed')),
                        );
                      },
                      style: MainButtonStyles.secondary),
                  SizedBox(height: 24),
                  CustomTermsPrivacyNotice(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
