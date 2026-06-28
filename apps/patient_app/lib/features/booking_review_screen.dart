import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/text_styles.dart';

// Assumes AppColors and AppTextStyles are defined in your project.

// ─── Data model passed into this screen ──────────────────────────────────────
class BookingReviewData {
  // Doctor
  final String doctorName;
  final String doctorSpecialty;
  final double doctorRating;
  final int doctorReviewCount;
  final int doctorExperienceYears;
  final String doctorImageAsset;

  // Appointment
  final String appointmentType;
  final String appointmentPlace;
  final String appointmentMedium;

  // Timing
  final String day;
  final String time;
  final String duration;

  // Cost
  final String price;
  final bool insuranceActive;
  final String insuranceProvider;

  const BookingReviewData({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorRating,
    required this.doctorReviewCount,
    required this.doctorExperienceYears,
    required this.doctorImageAsset,
    required this.appointmentType,
    required this.appointmentPlace,
    required this.appointmentMedium,
    required this.day,
    required this.time,
    required this.duration,
    required this.price,
    required this.insuranceActive,
    required this.insuranceProvider,
  });
}

// ─── Widget ──────────────────────────────────────────────────────────────────
class BookingReviewScreen extends StatelessWidget {
  final BookingReviewData data;
  final VoidCallback? onConfirm;
  final VoidCallback? onBack;

  static const _ts = AppTextStyles();

  // Default sample data so the widget renders standalone during dev
  static const _sample = BookingReviewData(
    doctorName: 'د. عبد الرحمن عبد السلام',
    doctorSpecialty: 'أخصائي أنف وأذن وحنجرة',
    doctorRating: 4.6,
    doctorReviewCount: 596,
    doctorExperienceYears: 15,
    doctorImageAsset: 'assets/images/doctor_avatar.png',
    appointmentType: 'استشارة',
    appointmentPlace: 'عن بُعد',
    appointmentMedium: 'مكالمة مرئية',
    day: 'السبت 20 يونيو 2026',
    time: '4:00 مساءً',
    duration: '20 دقيقة',
    price: '200 جنيه',
    insuranceActive: true,
    insuranceProvider: 'نقابة المهندسين',
  );

  const BookingReviewScreen({
    super.key,
    this.data = _sample,
    this.onConfirm,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.naturalLightGray3,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Top bar ──────────────────────────────────────────────
              _buildTopBar(),

              // ── Stepper (all complete) ────────────────────────────────
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: const _StepIndicator(currentStep: 4), // > 3 = all done
              ),

              // ── Cards ────────────────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Column(
                    children: [
                      _DoctorCard(data: data),
                      const SizedBox(height: 12),
                      _AppointmentCard(data: data),
                      const SizedBox(height: 12),
                      _TimingCard(data: data),
                      const SizedBox(height: 12),
                      _CostCard(data: data),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),

              // ── Bottom bar ────────────────────────────────────────────
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      child: Center(
        child: Text(
          'مراجعة تفاصيل الحجز',
          style: _ts.titleMed.copyWith(color: AppColors.naturalBlack),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      child: Row(
        children: [
          // تأكيد الحجز
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.patientPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'تأكيد الحجز',
                  style: _ts.bodyMed.copyWith(color: AppColors.naturalWhite),
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
                onPressed: onBack,
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.naturalWhite,
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
                    const SizedBox(width: 8),
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

// ─── Doctor Card ─────────────────────────────────────────────────────────────
class _DoctorCard extends StatelessWidget {
  final BookingReviewData data;
  static const _ts = AppTextStyles();

  const _DoctorCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return _ReviewCard(
      title: 'الطبيب',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.doctorName,
                  style: _ts.bodyMed.copyWith(color: AppColors.naturalBlack),
                ),
                const SizedBox(height: 4),
                Text(
                  data.doctorSpecialty,
                  style:
                      _ts.subBodyReg.copyWith(color: AppColors.naturalDarkGrey),
                ),
                const SizedBox(height: 8),
                // Rating
                Row(
                  children: [
                    Text(
                      '${data.doctorRating} تقييم عام من ${data.doctorReviewCount} شخص',
                      style: _ts.subBodyM
                          .copyWith(color: AppColors.naturalLightGray),
                    ),
                    const SizedBox(width: 4),
                    const FaIcon(
                      FontAwesomeIcons.solidStar,
                      color: AppColors.alertWarning,
                      size: 13,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Experience
                Row(
                  children: [
                    Text(
                      '${data.doctorExperienceYears}+ سنة خبرة',
                      style: _ts.subBodyM
                          .copyWith(color: AppColors.naturalLightGray),
                    ),
                    const SizedBox(width: 4),
                    const FaIcon(
                      FontAwesomeIcons.briefcase,
                      color: AppColors.naturalLightGray,
                      size: 13,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              data.doctorImageAsset,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.patientPrimaryLight4,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const FaIcon(
                  FontAwesomeIcons.userDoctor,
                  size: 40,
                  color: AppColors.patientPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Appointment Card ─────────────────────────────────────────────────────────
class _AppointmentCard extends StatelessWidget {
  final BookingReviewData data;

  const _AppointmentCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return _ReviewCard(
      title: 'الموعد',
      child: Column(
        children: [
          _InfoRow(
            icon: FontAwesomeIcons.stethoscope,
            label: 'نوع الموعد',
            value: data.appointmentType,
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: FontAwesomeIcons.globe,
            label: 'المكان',
            value: data.appointmentPlace,
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: FontAwesomeIcons.video,
            label: 'الوسيلة',
            value: data.appointmentMedium,
          ),
        ],
      ),
    );
  }
}

// ─── Timing Card ──────────────────────────────────────────────────────────────
class _TimingCard extends StatelessWidget {
  final BookingReviewData data;

  const _TimingCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return _ReviewCard(
      title: 'التوقيت',
      child: Column(
        children: [
          _InfoRow(
            icon: FontAwesomeIcons.calendarDay,
            label: 'اليوم',
            value: data.day,
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: FontAwesomeIcons.clock,
            label: 'الوقت',
            value: data.time,
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: FontAwesomeIcons.stopwatch,
            label: 'المدة',
            value: data.duration,
          ),
        ],
      ),
    );
  }
}

// ─── Cost Card ────────────────────────────────────────────────────────────────
class _CostCard extends StatelessWidget {
  final BookingReviewData data;

  const _CostCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return _ReviewCard(
      title: 'التكلفة',
      child: Column(
        children: [
          _InfoRow(
            icon: FontAwesomeIcons.moneyBill1Wave,
            label: 'السعر',
            value: data.price,
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: FontAwesomeIcons.shieldHalved,
            label: 'التأمين',
            value: data.insuranceActive ? 'تم التفعيل' : 'غير مفعّل',
            valueColor: data.insuranceActive
                ? AppColors.alertSuccess
                : AppColors.alertError,
          ),
          const SizedBox(height: 10),
          _InfoRow(
            icon: FontAwesomeIcons.buildingShield,
            label: 'جهة التأمين',
            value: data.insuranceProvider,
          ),
        ],
      ),
    );
  }
}

// ─── Shared card wrapper ──────────────────────────────────────────────────────
class _ReviewCard extends StatelessWidget {
  final String title;
  final Widget child;
  static const _ts = AppTextStyles();

  const _ReviewCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.naturalLightGray2.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: _ts.bodyMed.copyWith(color: AppColors.naturalBlack),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

// ─── Info row (icon + label: value) ──────────────────────────────────────────
class _InfoRow extends StatelessWidget {
  final FaIconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  static const _ts = AppTextStyles();

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Value + label (RTL: value first on right)
        Expanded(
          child: Text(
            '$label: $value',
            style: _ts.subBodyReg.copyWith(
              color: valueColor ?? AppColors.naturalDarkGrey,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 10),
        // Icon
        FaIcon(icon, color: AppColors.patientPrimary, size: 16),
      ],
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
        _StepBubble(number: 3, label: 'التأمين', currentStep: currentStep),
        _StepLine(isCompleted: currentStep > 2),
        _StepBubble(number: 2, label: 'التوقيت', currentStep: currentStep),
        _StepLine(isCompleted: currentStep > 1),
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
    final isCompleted = currentStep > number;
    final isActive = currentStep == number;

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
            child: isCompleted || isActive
                ? const FaIcon(
                    FontAwesomeIcons.check,
                    color: AppColors.naturalWhite,
                    size: 16,
                  )
                : Text(
                    '$number',
                    style: _ts.subBodyReg
                        .copyWith(color: AppColors.naturalLightGray),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: _ts.navbar.copyWith(color: labelColor)),
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
