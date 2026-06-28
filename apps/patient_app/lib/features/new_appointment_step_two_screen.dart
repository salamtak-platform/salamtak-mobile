import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/text_styles.dart';

// Assumes AppColors and AppTextStyles are already defined in your project.

// ─── Models ──────────────────────────────────────────────────────────────────
enum SlotStatus { available, selected, unavailable }

class DaySlot {
  final String dayName;
  final int dayNumber;
  final bool isAvailable;

  const DaySlot({
    required this.dayName,
    required this.dayNumber,
    required this.isAvailable,
  });
}

class TimeSlot {
  final String time;
  final SlotStatus status;

  const TimeSlot({required this.time, required this.status});
}

// ─── Widget ──────────────────────────────────────────────────────────────────
class NewAppointmentStepTwoScreen extends StatefulWidget {
  final VoidCallback? onNext;
  final VoidCallback? onBack;

  const NewAppointmentStepTwoScreen({
    super.key,
    this.onNext,
    this.onBack,
  });

  @override
  State<NewAppointmentStepTwoScreen> createState() =>
      _NewAppointmentStepTwoScreenState();
}

class _NewAppointmentStepTwoScreenState
    extends State<NewAppointmentStepTwoScreen> {
  static const _ts = AppTextStyles();

  int _selectedDayIndex = 0; // index into _days, day 9 (خميس)
  int _selectedTimeIndex = 2; // 07:30 م

  final List<DaySlot> _days = const [
    DaySlot(dayName: 'اربعاء', dayNumber: 8, isAvailable: true),
    DaySlot(dayName: 'خميس', dayNumber: 9, isAvailable: true),
    DaySlot(dayName: 'جمعة', dayNumber: 10, isAvailable: true),
    DaySlot(dayName: 'سبت', dayNumber: 11, isAvailable: true),
    DaySlot(dayName: 'احد', dayNumber: 12, isAvailable: false),
    DaySlot(dayName: 'اثنين', dayNumber: 13, isAvailable: false),
  ];

  // Rows of 3 slots (RTL order per row matches design)
  final List<TimeSlot> _timeSlots = const [
    TimeSlot(time: '04:30 م', status: SlotStatus.available),
    TimeSlot(time: '05:00 م', status: SlotStatus.available),
    TimeSlot(time: '05:30 م', status: SlotStatus.available),
    TimeSlot(time: '07:30 م', status: SlotStatus.available),
    TimeSlot(time: '04:00 م', status: SlotStatus.available),
    TimeSlot(time: '04:00 م', status: SlotStatus.unavailable),
    TimeSlot(time: '09:30 م', status: SlotStatus.available),
    TimeSlot(time: '06:00 م', status: SlotStatus.unavailable),
    TimeSlot(time: '07:00 م', status: SlotStatus.unavailable),
    TimeSlot(time: '08:00 م', status: SlotStatus.available),
    TimeSlot(time: '08:30 م', status: SlotStatus.available),
    TimeSlot(time: '09:00 م', status: SlotStatus.available),
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
                child: _StepIndicator(currentStep: 2),
              ),

              // ── Scrollable content ───────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section: اليوم
                      Text(
                        'اليوم',
                        style: _ts.titleMed
                            .copyWith(color: AppColors.naturalBlack),
                      ),
                      const SizedBox(height: 12),
                      _buildDayPicker(),
                      const SizedBox(height: 28),

                      // Section: الوقت
                      Text(
                        'الوقت',
                        style: _ts.titleMed
                            .copyWith(color: AppColors.naturalBlack),
                      ),
                      const SizedBox(height: 12),
                      _buildTimeGrid(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              // ── Bottom actions ───────────────────────────────────────
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

  // ── Day picker ───────────────────────────────────────────────────────────
  Widget _buildDayPicker() {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        reverse: true, // RTL: rightmost day first in list
        itemCount: _days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final day = _days[i];
          final isSelected = _selectedDayIndex == i;
          final isDisabled = !day.isAvailable;

          Color bg;
          Color borderColor;
          Color nameColor;
          Color numberColor;

          if (isSelected) {
            bg = AppColors.patientPrimary;
            borderColor = AppColors.patientPrimary;
            nameColor = AppColors.naturalWhite;
            numberColor = AppColors.naturalWhite;
          } else if (isDisabled) {
            bg = AppColors.naturalLightGray2;
            borderColor = AppColors.naturalLightGray2;
            nameColor = AppColors.naturalWhite;
            numberColor = AppColors.naturalWhite;
          } else {
            bg = AppColors.naturalWhite;
            borderColor = AppColors.naturalLightGray2;
            nameColor = AppColors.naturalDarkGrey;
            numberColor = AppColors.naturalBlack;
          }

          return GestureDetector(
            onTap:
                isDisabled ? null : () => setState(() => _selectedDayIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 72,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderColor, width: 1.2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day.dayName,
                    style: _ts.subBodyM.copyWith(color: nameColor),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${day.dayNumber}',
                    style: _ts.bodyMed.copyWith(color: numberColor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Time grid ────────────────────────────────────────────────────────────
  Widget _buildTimeGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _timeSlots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.6,
      ),
      itemBuilder: (_, i) {
        final slot = _timeSlots[i];
        final isSelected = _selectedTimeIndex == i;
        final isUnavailable = slot.status == SlotStatus.unavailable;

        Color bg;
        Color borderColor;
        Color textColor;

        if (isSelected) {
          bg = AppColors.patientPrimary;
          borderColor = AppColors.patientPrimary;
          textColor = AppColors.naturalWhite;
        } else if (isUnavailable) {
          bg = AppColors.naturalLightGray2;
          borderColor = AppColors.naturalLightGray2;
          textColor = AppColors.naturalDarkGrey;
        } else {
          bg = AppColors.naturalWhite;
          borderColor = AppColors.naturalLightGray2;
          textColor = AppColors.naturalBlack;
        }

        return GestureDetector(
          onTap: isUnavailable
              ? null
              : () => setState(() => _selectedTimeIndex = i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor, width: 1.2),
            ),
            child: Center(
              child: Text(
                slot.time,
                style: _ts.subBodyM.copyWith(color: textColor),
              ),
            ),
          ),
        );
      },
    );
  }

  // ── Bottom bar ───────────────────────────────────────────────────────────
  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      child: Row(
        children: [
          // ── Next ──────────────────────────────────────────────────────
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
          // ── Back ──────────────────────────────────────────────────────
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

// ─── Step Indicator ──────────────────────────────────────────────────────────
class _StepIndicator extends StatelessWidget {
  final int currentStep;
  static const _ts = AppTextStyles();

  const _StepIndicator({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Step 3 — leftmost in RTL
        _StepBubble(number: 3, label: 'التأمين', currentStep: currentStep),
        _StepLine(isCompleted: currentStep > 2),
        // Step 2 — center
        _StepBubble(number: 2, label: 'التوقيت', currentStep: currentStep),
        _StepLine(isCompleted: currentStep > 1),
        // Step 1 — rightmost in RTL
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
