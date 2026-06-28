import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/text_styles.dart';

// Assumes AppColors and AppTextStyles are defined in your project.

// ─── Model ───────────────────────────────────────────────────────────────────
class InsuranceCompany {
  final String name;
  final String logoAsset;

  const InsuranceCompany({required this.name, required this.logoAsset});
}

// ─── Widget ──────────────────────────────────────────────────────────────────
class NewAppointmentStepThreeScreen extends StatefulWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;

  const NewAppointmentStepThreeScreen({
    super.key,
    this.onNext,
    this.onBack,
  });

  @override
  State<NewAppointmentStepThreeScreen> createState() =>
      _NewAppointmentStepThreeScreenState();
}

class _NewAppointmentStepThreeScreenState
    extends State<NewAppointmentStepThreeScreen> {
  static const _ts = AppTextStyles();

  bool _hasInsurance = true;
  int _selectedInsuranceIndex = 1; // نقابة المهندسين المصريين

  final List<InsuranceCompany> _companies = const [
    InsuranceCompany(
      name: 'أكسا',
      logoAsset: 'assets/images/insurance_axa.png',
    ),
    InsuranceCompany(
      name: 'نقابة المهندسين المصريين',
      logoAsset: 'assets/images/insurance_engineers.png',
    ),
    InsuranceCompany(
      name: 'أكسترا كير',
      logoAsset: 'assets/images/insurance_extracare.png',
    ),
    InsuranceCompany(
      name: 'ميد رايت',
      logoAsset: 'assets/images/insurance_medright.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.naturalWhite,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Top bar ──────────────────────────────────────────────
              _buildTopBar(),

              // ── Stepper ──────────────────────────────────────────────
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: const _StepIndicator(currentStep: 3),
              ),

              // ── Scrollable body ───────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question
                      Text(
                        'هل لديك شركة تأمين متعاقدة مع هذا الطبيب؟',
                        style:
                            _ts.bodyMed.copyWith(color: AppColors.naturalBlack),
                      ),
                      const SizedBox(height: 14),

                      // Yes / No toggle
                      _buildYesNoToggle(),
                      const SizedBox(height: 24),

                      // Insurance list (shown only when hasInsurance = true)
                      if (_hasInsurance) ...[
                        Text(
                          'اختر شركة التأمين',
                          style: _ts.bodyMed
                              .copyWith(color: AppColors.naturalBlack),
                        ),
                        const SizedBox(height: 12),
                        ..._buildInsuranceList(),
                      ],
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              // ── Bottom actions ────────────────────────────────────────
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
      child: Center(
        child: Text(
          'حجز موعد جديد',
          style: _ts.titleMed.copyWith(color: AppColors.naturalBlack),
        ),
      ),
    );
  }

  // ── Yes / No toggle ───────────────────────────────────────────────────────
  Widget _buildYesNoToggle() {
    return Row(
      children: [
        // لا
        Expanded(
            child: _ToggleButton(
          label: 'لا',
          isSelected: !_hasInsurance,
          onTap: () => setState(() {
            _hasInsurance = false;
            _selectedInsuranceIndex = -1;
          }),
        )),
        const SizedBox(width: 12),
        // نعم
        Expanded(
            child: _ToggleButton(
          label: 'نعم',
          isSelected: _hasInsurance,
          onTap: () => setState(() => _hasInsurance = true),
        )),
      ],
    );
  }

  // ── Insurance list ────────────────────────────────────────────────────────
  List<Widget> _buildInsuranceList() {
    return List.generate(_companies.length, (i) {
      final company = _companies[i];
      final isSelected = _selectedInsuranceIndex == i;

      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () => setState(() => _selectedInsuranceIndex = i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: 68,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.patientPrimaryLight4
                  : AppColors.naturalWhite,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isSelected
                    ? AppColors.patientPrimary
                    : AppColors.naturalLightGray2,
                width: isSelected ? 1.8 : 1.2,
              ),
            ),
            child: Row(
              children: [
                // Logo
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    company.logoAsset,
                    width: 44,
                    height: 44,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.naturalLightGray3,
                        shape: BoxShape.circle,
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.buildingShield,
                        size: 20,
                        color: AppColors.naturalLightGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Name
                Expanded(
                  child: Text(
                    company.name,
                    style: _ts.bodyReg.copyWith(
                      color: isSelected
                          ? AppColors.patientPrimary
                          : AppColors.naturalBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  // ── Bottom bar ────────────────────────────────────────────────────────────
  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      child: Row(
        children: [
          // التالي
          Expanded(
            flex: 3,
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
                    const SizedBox(width: 10),
                    Text(
                      'التالي',
                      style:
                          _ts.bodyMed.copyWith(color: AppColors.naturalWhite),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // السابق
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 56,
              child: OutlinedButton(
                onPressed: widget.onBack,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: AppColors.patientPrimary, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'السابق',
                      style:
                          _ts.bodyMed.copyWith(color: AppColors.patientPrimary),
                    ),
                    const SizedBox(width: 10),
                    const FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: AppColors.patientPrimary,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Toggle Button ────────────────────────────────────────────────────────────
class _ToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  static const _ts = AppTextStyles();

  const _ToggleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 52,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.patientPrimaryLight4
              : AppColors.naturalWhite,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? AppColors.patientPrimary
                : AppColors.naturalLightGray2,
            width: isSelected ? 1.8 : 1.2,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: _ts.bodyMed.copyWith(
              color: isSelected
                  ? AppColors.patientPrimary
                  : AppColors.naturalDarkGrey,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Step Indicator ───────────────────────────────────────────────────────────
class _StepIndicator extends StatelessWidget {
  final int currentStep;
  static const _ts = AppTextStyles();

  const _StepIndicator({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Step 3 — leftmost in RTL (active)
        _StepBubble(number: 3, label: 'التأمين', currentStep: currentStep),
        _StepLine(isCompleted: currentStep > 2),
        // Step 2 — center (completed)
        _StepBubble(number: 2, label: 'التوقيت', currentStep: currentStep),
        _StepLine(isCompleted: currentStep > 1),
        // Step 1 — rightmost in RTL (completed)
        _StepBubble(number: 1, label: 'النوع', currentStep: currentStep),
      ],
    );
  }
}

class _StepBubble extends StatelessWidget {
  final int number;
  final String label;
  final int currentStep;
  static const _ts = AppTextStyles();

  const _StepBubble({
    required this.number,
    required this.label,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = currentStep == number;
    final isCompleted = currentStep > number;

    final Color circleBg = (isActive || isCompleted)
        ? AppColors.patientPrimary
        : AppColors.naturalWhite;
    final Color circleBorder = (isActive || isCompleted)
        ? AppColors.patientPrimary
        : AppColors.naturalLightGray2;
    final Color labelColor =
        isActive ? AppColors.patientPrimary : AppColors.naturalLightGray;

    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: circleBg,
            shape: BoxShape.circle,
            border: Border.all(color: circleBorder, width: 1.5),
          ),
          child: Center(
            child: isCompleted
                ? const FaIcon(
                    FontAwesomeIcons.check,
                    color: AppColors.naturalWhite,
                    size: 16,
                  )
                : Text(
                    '$number',
                    style: _ts.subBodyReg.copyWith(
                      color: isActive
                          ? AppColors.naturalWhite
                          : AppColors.naturalLightGray,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
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
