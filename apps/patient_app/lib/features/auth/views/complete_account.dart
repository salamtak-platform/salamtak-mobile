import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/components/custom_text_field.dart';
import 'package:patient_app/components/gender_selector.dart';
import 'package:patient_app/components/custom_main_button.dart';
import 'package:patient_app/features/auth/cubit/auth_cubit.dart';
import 'package:patient_app/features/auth/cubit/auth_states.dart';
import 'package:patient_app/features/main_view.dart';

class CompleteAccount extends StatefulWidget {
  static String id = "CompleteAccount";

  const CompleteAccount({super.key});

  @override
  State<CompleteAccount> createState() => _CompleteAccountState();
}

class _CompleteAccountState extends State<CompleteAccount> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _dobController;

  String _gender = 'male';
  DateTime? _selectedDate;
  File? _profileImage;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _dobController = TextEditingController();

    final cubit = context.read<AuthCubit>();
    _phoneController = TextEditingController(text: cubit.phoneNumber ?? "");
    _emailController = TextEditingController(text: cubit.email ?? "");
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.naturalWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library,
                    color: AppColors.patientPrimary),
                title: Text(
                  'اختر من المعرض',
                  style:
                      TextStyle(fontFamily: "Baloo Bhaijaan 2", fontSize: 16),
                ),
                onTap: () async {
                  Navigator.of(context).pop();
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _profileImage = File(pickedFile.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt,
                    color: AppColors.patientPrimary),
                title: Text(
                  'التقط صورة',
                  style:
                      TextStyle(fontFamily: "Baloo Bhaijaan 2", fontSize: 16),
                ),
                onTap: () async {
                  Navigator.of(context).pop();
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _profileImage = File(pickedFile.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.patientPrimary,
              onPrimary: AppColors.naturalWhite,
              onSurface: AppColors.naturalBlack,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CompleteAccountSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
          );
          Navigator.pushNamedAndRemoveUntil(
              context, MainView.id, (route) => false);
        } else if (state is CompleteAccountFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final isLoading = state is CompleteAccountLoading;
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                SharedLocalizations.of(context)!
                                    .completeAccTitle,
                                style: const TextStyle(
                                  fontFamily: "Baloo Bhaijaan 2",
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Center(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    GestureDetector(
                                      onTap: _pickImage,
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.patientPrimary,
                                            width: 4,
                                          ),
                                        ),
                                        child: ClipOval(
                                          child: _profileImage != null
                                              ? Image.file(
                                                  _profileImage!,
                                                  fit: BoxFit.cover,
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Image.asset(
                                                    "assets/images/user_avatar.png",
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: _pickImage,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: AppColors.patientPrimary,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: AppColors.naturalWhite,
                                              width: 2,
                                            ),
                                          ),
                                          child: const FaIcon(
                                            FontAwesomeIcons.penToSquare,
                                            size: 18,
                                            color: AppColors.naturalWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      controller: _firstNameController,
                                      readOnly: false,
                                      label: SharedLocalizations.of(context)!
                                          .inputFirstNameLabel,
                                      keyboardType: TextInputType.name,
                                      prefixIconName: FontAwesomeIcons.user,
                                      hint: SharedLocalizations.of(context)!
                                          .inputFirstNameHint,
                                      type: CustomTextFieldType.other,
                                      onChanged: (val) {},
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return SharedLocalizations.of(
                                                  context)!
                                              .inputRequiredError;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: CustomTextFormField(
                                      controller: _lastNameController,
                                      readOnly: false,
                                      label: SharedLocalizations.of(context)!
                                          .inputLastNameLabel,
                                      keyboardType: TextInputType.name,
                                      prefixIconName: FontAwesomeIcons.user,
                                      hint: SharedLocalizations.of(context)!
                                          .inputLastNameHint,
                                      type: CustomTextFieldType.other,
                                      onChanged: (val) {},
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return SharedLocalizations.of(
                                                  context)!
                                              .inputRequiredError;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              CustomTextFormField(
                                controller: _phoneController,
                                readOnly:
                                    context.read<AuthCubit>().phoneNumber !=
                                            null &&
                                        context
                                            .read<AuthCubit>()
                                            .phoneNumber!
                                            .isNotEmpty,
                                label: SharedLocalizations.of(context)!
                                    .inputPhoneLabel,
                                keyboardType: TextInputType.phone,
                                prefixIconName: FontAwesomeIcons.phoneFlip,
                                hint: SharedLocalizations.of(context)!
                                    .inputPhoneHint,
                                type: CustomTextFieldType.phone,
                                onChanged: (val) {},
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return SharedLocalizations.of(context)!
                                        .inputRequiredError;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),
                              CustomTextFormField(
                                controller: _emailController,
                                readOnly: context.read<AuthCubit>().email !=
                                        null &&
                                    context.read<AuthCubit>().email!.isNotEmpty,
                                label: SharedLocalizations.of(context)!
                                    .inputEmailLabel,
                                keyboardType: TextInputType.emailAddress,
                                prefixIconName: FontAwesomeIcons.envelope,
                                hint: SharedLocalizations.of(context)!
                                    .inputEmailHint,
                                type: CustomTextFieldType.other,
                                onChanged: (val) {},
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return SharedLocalizations.of(context)!
                                        .inputRequiredError;
                                  }
                                  final emailRegex =
                                      RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                                  if (!emailRegex.hasMatch(value)) {
                                    return SharedLocalizations.of(context)!
                                        .emailVaildFormatError;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),
                              CustomTextFormField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                readOnly: false,
                                label: SharedLocalizations.of(context)!
                                    .inputPassLabel,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIconName: FontAwesomeIcons.lock,
                                suffixIconName: _obscurePassword
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                hint: SharedLocalizations.of(context)!
                                    .inputShownPassHint,
                                type: CustomTextFieldType.other,
                                onChanged: (val) {},
                                onTap: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return SharedLocalizations.of(context)!
                                        .inputRequiredError;
                                  }
                                  if (value.length < 8) {
                                    return SharedLocalizations.of(context)!
                                        .passwordLengthError;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),
                              CustomTextFormField(
                                controller: _confirmPasswordController,
                                obscureText: _obscureConfirmPassword,
                                readOnly: false,
                                label: SharedLocalizations.of(context)!
                                    .inputConfPassLabel,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIconName: FontAwesomeIcons.lock,
                                suffixIconName: _obscureConfirmPassword
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                hint: SharedLocalizations.of(context)!
                                    .inputShownPassHint,
                                type: CustomTextFieldType.other,
                                onChanged: (val) {},
                                onTap: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return SharedLocalizations.of(context)!
                                        .inputRequiredError;
                                  }
                                  if (value != _passwordController.text) {
                                    return SharedLocalizations.of(context)!
                                        .passwordsMatchingError;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),
                              GenderSelector(
                                selectedGender: _gender,
                                onChanged: (val) {
                                  setState(() {
                                    _gender = val;
                                  });
                                },
                              ),
                              const SizedBox(height: 24),
                              GestureDetector(
                                onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                  child: CustomTextFormField(
                                    controller: _dobController,
                                    readOnly: true,
                                    label: SharedLocalizations.of(context)!
                                        .inputBirthdateLabel,
                                    keyboardType: null,
                                    prefixIconName:
                                        FontAwesomeIcons.calendarDays,
                                    hint: SharedLocalizations.of(context)!
                                        .inputBirthdateHint,
                                    type: CustomTextFieldType.other,
                                    onChanged: (val) {},
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return SharedLocalizations.of(context)!
                                            .inputRequiredError;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomMainButton(
                      title: SharedLocalizations.of(context)!.createAccButton,
                      style: MainButtonStyles.primary,
                      state: isLoading
                          ? MainButtonStates.loading
                          : MainButtonStates.enabled,
                      isLeftIcon: false,
                      isRightIcon: false,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().completeRegistration(
                                firstName: _firstNameController.text.trim(),
                                lastName: _lastNameController.text.trim(),
                                phone: _phoneController.text.trim(),
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                confirmPassword:
                                    _confirmPasswordController.text.trim(),
                                gender: _gender,
                                dateOfBirth: _dobController.text.trim(),
                                profileImagePath: _profileImage?.path,
                              );
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
