import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';

// ─── Text Styles ─────────────────────────────────────────────────────────────
class AppTextStyles {
  const AppTextStyles();
  TextStyle get headerMed => const TextStyle(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Medium',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 36 / 24,
        letterSpacing: 0,
      );
  TextStyle get headerSb => const TextStyle(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-SemiBold',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        height: 36 / 24,
        letterSpacing: 0,
      );
  TextStyle get subHeaderMed => const TextStyle(
        fontSize: 22,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Medium',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 33 / 22,
        letterSpacing: 0,
      );
  TextStyle get subHeaderReg => const TextStyle(
        fontSize: 22,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 33 / 22,
        letterSpacing: 0,
      );
  TextStyle get titleMed => const TextStyle(
        fontSize: 20,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Medium',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 30 / 20,
        letterSpacing: 0,
      );
  TextStyle get ritleReg => const TextStyle(
        fontSize: 20,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 30 / 20,
        letterSpacing: 0,
      );
  TextStyle get bodyMed => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Medium',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0,
      );
  TextStyle get bodyReg => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: 0,
      );
  TextStyle get bodyTwoReg => const TextStyle(
        fontSize: 15,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 22.5 / 15,
        letterSpacing: 0,
      );
  TextStyle get subBodyReg => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Medium',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 21 / 14,
        letterSpacing: 0,
      );
  TextStyle get subBodyM => const TextStyle(
        fontSize: 13,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Medium',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 19.5 / 13,
        letterSpacing: 0,
      );
  TextStyle get navbar => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontFamily: 'BalooBhaijaan2-Medium',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 18 / 12,
        letterSpacing: 0,
      );
}

// ─── Enums ───────────────────────────────────────────────────────────────────
enum AppointmentType { consultation, followUp }

enum AppointmentPlace { remote, clinic }

enum AppointmentMedium { video, audio }

// ─── Widget ──────────────────────────────────────────────────────────────────
class NewAppointmentStepOneScreen extends StatefulWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;

  const NewAppointmentStepOneScreen({
    super.key,
    this.onNext,
    this.onBack,
  });

  @override
  State<NewAppointmentStepOneScreen> createState() =>
      _NewAppointmentStepOneScreenState();
}

class _NewAppointmentStepOneScreenState
    extends State<NewAppointmentStepOneScreen> {
  static const _ts = AppTextStyles();

  AppointmentType _selectedType = AppointmentType.consultation;
  AppointmentPlace _selectedPlace = AppointmentPlace.remote;
  AppointmentMedium _selectedMedium = AppointmentMedium.video;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.naturalWhite,
        body: SafeArea(
          child: Column(
            children: [
              // ── Top bar ────────────────────────────────────────────────
              _buildTopBar(),

              // ── Stepper ────────────────────────────────────────────────
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: _StepIndicator(currentStep: 1),
              ),

              // ── Scrollable body ────────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section: الموعد
                      _SectionLabel(label: 'الموعد'),
                      const SizedBox(height: 12),
                      _SelectionGrid(
                        children: [
                          _SelectionCard(
                            label: 'كشف / استشارة',
                            imagePath:
                                'assets/images/appointment_consultation.png',
                            isSelected:
                                _selectedType == AppointmentType.consultation,
                            onTap: () => setState(() =>
                                _selectedType = AppointmentType.consultation),
                          ),
                          _SelectionCard(
                            label: 'متابعة',
                            imagePath: 'assets/images/appointment_followup.png',
                            isSelected:
                                _selectedType == AppointmentType.followUp,
                            onTap: () => setState(
                                () => _selectedType = AppointmentType.followUp),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Section: المكان
                      _SectionLabel(label: 'المكان'),
                      const SizedBox(height: 12),
                      _SelectionGrid(
                        children: [
                          _SelectionCard(
                            label: 'عن بُعد',
                            imagePath: 'assets/images/appointment_remote.png',
                            isSelected:
                                _selectedPlace == AppointmentPlace.remote,
                            onTap: () => setState(
                                () => _selectedPlace = AppointmentPlace.remote),
                          ),
                          _SelectionCard(
                            label: 'في العيادة',
                            imagePath: 'assets/images/appointment_clinic.png',
                            isSelected:
                                _selectedPlace == AppointmentPlace.clinic,
                            onTap: () => setState(
                                () => _selectedPlace = AppointmentPlace.clinic),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Section: الوسيلة
                      _SectionLabel(label: 'الوسيلة'),
                      const SizedBox(height: 12),
                      _SelectionGrid(
                        children: [
                          _SelectionCard(
                            label: 'مكالمة مرئية',
                            imagePath: 'assets/images/appointment_video.png',
                            isSelected:
                                _selectedMedium == AppointmentMedium.video,
                            onTap: () => setState(() =>
                                _selectedMedium = AppointmentMedium.video),
                          ),
                          _SelectionCard(
                            label: 'مكالمة صوتية',
                            imagePath: 'assets/images/appointment_audio.png',
                            isSelected:
                                _selectedMedium == AppointmentMedium.audio,
                            onTap: () => setState(() =>
                                _selectedMedium = AppointmentMedium.audio),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),

              // ── Bottom button ──────────────────────────────────────────
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  // ── Top bar ──────────────────────────────────────────────────────────────
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            'حجز موعد جديد',
            style: _ts.titleMed.copyWith(color: AppColors.naturalBlack),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: widget.onBack,
              child: const FaIcon(
                FontAwesomeIcons.arrowRight,
                color: AppColors.naturalBlack,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Bottom bar ───────────────────────────────────────────────────────────
  Widget _buildBottomBar() {
    return Container(
      color: AppColors.naturalWhite,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      child: SizedBox(
        height: 56,
        child: ElevatedButton(
          onPressed: widget.onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.patientPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: AppColors.naturalWhite,
                size: 14,
              ),
              const SizedBox(width: 12),
              Text(
                'التالي',
                style: _ts.bodyMed.copyWith(color: AppColors.naturalWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Step Indicator ──────────────────────────────────────────────────────────
class _StepIndicator extends StatelessWidget {
  final int currentStep; // 1-indexed
  static const _ts = AppTextStyles();

  const _StepIndicator({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    // Steps shown RTL: 1 (right) → 2 (center) → 3 (left)
    final steps = [
      _StepData(number: 1, label: 'النوع'),
      _StepData(number: 2, label: 'التوقيت'),
      _StepData(number: 3, label: 'التأمين'),
    ];

    return Row(
      children: [
        // Step 3 (leftmost in RTL)
        _StepBubble(
          data: steps[2],
          isActive: currentStep == 3,
          isCompleted: currentStep > 3,
        ),
        _StepLine(isCompleted: currentStep > 2),
        // Step 2 (center)
        _StepBubble(
          data: steps[1],
          isActive: currentStep == 2,
          isCompleted: currentStep > 2,
        ),
        _StepLine(isCompleted: currentStep > 1),
        // Step 1 (rightmost in RTL)
        _StepBubble(
          data: steps[0],
          isActive: currentStep == 1,
          isCompleted: currentStep > 1,
        ),
      ],
    );
  }
}

class _StepData {
  final int number;
  final String label;
  const _StepData({required this.number, required this.label});
}

class _StepBubble extends StatelessWidget {
  final _StepData data;
  final bool isActive;
  final bool isCompleted;
  static const _ts = AppTextStyles();

  const _StepBubble({
    required this.data,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final Color circleBg = (isActive || isCompleted)
        ? AppColors.patientPrimary
        : AppColors.naturalWhite;
    final Color circleBorder = (isActive || isCompleted)
        ? AppColors.patientPrimary
        : AppColors.naturalLightGray2;
    final Color textColor = (isActive || isCompleted)
        ? AppColors.naturalWhite
        : AppColors.naturalLightGray;
    final Color labelColor =
        isActive ? AppColors.patientPrimary : AppColors.naturalLightGray;

    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: circleBg,
            shape: BoxShape.circle,
            border: Border.all(color: circleBorder, width: 1.5),
          ),
          child: Center(
            child: Text(
              '${data.number}',
              style: _ts.subBodyReg.copyWith(color: textColor),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          data.label,
          style: _ts.navbar.copyWith(color: labelColor),
        ),
      ],
    );
  }
}

class _StepLine extends StatelessWidget {
  final bool isCompleted;
  const _StepLine({required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1.5,
        margin: const EdgeInsets.only(bottom: 20),
        color: isCompleted
            ? AppColors.patientPrimary
            : AppColors.naturalLightGray2,
      ),
    );
  }
}

// ─── Section label ────────────────────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  final String label;
  static const _ts = AppTextStyles();

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: _ts.titleMed.copyWith(color: AppColors.naturalBlack),
    );
  }
}

// ─── 2-column grid wrapper ────────────────────────────────────────────────────
class _SelectionGrid extends StatelessWidget {
  final List<Widget> children;
  const _SelectionGrid({required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children
          .expand((w) => [Expanded(child: w), const SizedBox(width: 12)])
          .toList()
        ..removeLast(),
    );
  }
}

// ─── Selectable card ─────────────────────────────────────────────────────────
class _SelectionCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  static const _ts = AppTextStyles();

  const _SelectionCard({
    required this.label,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.patientPrimaryLight4
              : AppColors.naturalWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.patientPrimary
                : AppColors.naturalLightGray2,
            width: isSelected ? 1.8 : 1.2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image area
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
              child: SizedBox(
                height: 130,
                width: double.infinity,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => _ImagePlaceholder(
                    isSelected: isSelected,
                  ),
                ),
              ),
            ),
            // Label
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                label,
                style: _ts.bodyMed.copyWith(
                  color: isSelected
                      ? AppColors.patientPrimary
                      : AppColors.naturalDarkGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Placeholder when image asset is missing ──────────────────────────────────
class _ImagePlaceholder extends StatelessWidget {
  final bool isSelected;
  const _ImagePlaceholder({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected
          ? AppColors.patientPrimaryLight4
          : AppColors.naturalLightGray3,
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.image,
          size: 40,
          color: isSelected
              ? AppColors.patientPrimaryLight2
              : AppColors.naturalLightGray2,
        ),
      ),
    );
  }
}
