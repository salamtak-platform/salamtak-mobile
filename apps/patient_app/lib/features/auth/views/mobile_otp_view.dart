import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/components/opt_input_field.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/features/auth/views/home_view.dart';

class MobileOtpView extends StatefulWidget {
  static String id = "MobileOtpView";

  const MobileOtpView({super.key});

  @override
  State<MobileOtpView> createState() => _MobileOtpViewState();
}

class _MobileOtpViewState extends State<MobileOtpView> {
  String? otp;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerifyPhoneLoginSuccessState) {
          Navigator.pushNamed(context, HomeView.id);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.naturalWhite,
        appBar: AppBar(
          backgroundColor: AppColors.naturalWhite,
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                SharedLocalizations.of(context)!.verifyPhoneTitle,
                style: TextStyle(
                  fontFamily: "Baloo Bhaijaan 2",
                  fontSize: 24,
                  fontWeight: FontWeight(500),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                SharedLocalizations.of(context)!.verifyPhoneBody(""),
                style: TextStyle(
                  fontFamily: "Baloo Bhaijaan 2",
                  color: AppColors.naturalDarkGrey,
                  fontSize: 16,
                  fontWeight: FontWeight(500),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              OtpInputField(
                onCompleted: (value) {
                  otp = value;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                SharedLocalizations.of(context)!.resendOtpText(59),
                style: TextStyle(
                  fontFamily: "Baloo Bhaijaan 2",
                  color: AppColors.naturalDarkGrey,
                  fontSize: 16,
                  fontWeight: FontWeight(500),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: CustomMainButton(
                  title: SharedLocalizations.of(context)!.verifyOtpButton,
                  style: MainButtonStyles.primary,
                  state: MainButtonStates.enabled,
                  isLeftIcon: false,
                  isRightIcon: false,
                  onPressed: () {},
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
