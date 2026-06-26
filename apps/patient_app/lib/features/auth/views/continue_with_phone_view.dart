import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_labeled_divider.dart';
import 'package:patient_app/components/custom_social_button.dart';
import 'package:patient_app/components/custom_terms_privacy_notice.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/features/auth/views/home_view.dart';
import 'package:patient_app/features/auth/views/mobile_otp_view.dart';

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

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PhoneSearchFoundState ||
            state is PhoneSearchNotFoundState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MobileOtpView(),
            ),
          );
        } else if (state is PhoneSearchFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Phone search failed. Please try again.')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.naturalWhite,
        appBar: AppBar(),
        body: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          if (state is PhoneSearchLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
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
                        onChanged: (data) {
                          setState(() {
                            phoneNumber = data;
                            showError = false;
                          });
                        },
                        validator: (String? value) {},
                      ),
                      SizedBox(height: 32),
                      CustomMainButton(
                          title: SharedLocalizations.of(context)!
                              .continueWithPhoneButton,
                          state: MainButtonStates.enabled,
                          isLeftIcon: false,
                          isRightIcon: false,
                          onPressed: () {},
                          style: MainButtonStyles.primary),
                      SizedBox(height: 24),
                      CustomLabeledDivider(
                          label:
                              SharedLocalizations.of(context)!.commonOrLabel),
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
                            Navigator.pushNamed(context, HomeView.id);
                          },
                          style: MainButtonStyles.secondary),
                      SizedBox(height: 24),
                      CustomTermsPrivacyNotice(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
