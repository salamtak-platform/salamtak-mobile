import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';


// ─── Data Model ──────────────────────────────────────────────────────────────
class DoctorModel {
  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;
  final int experienceYears;
  final List<ServiceChip> services;

  const DoctorModel({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
    required this.experienceYears,
    required this.services,
  });
}

class ServiceChip {
  final ServiceType type;
  final String? location;
  final String? subLocation;
  final int? price;
  final String? timeLabel;
  final String? timeValue;

  const ServiceChip({
    required this.type,
    this.location,
    this.subLocation,
    this.price,
    this.timeLabel,
    this.timeValue,
  });
}

enum ServiceType { clinic, remote, time }

// ─── Sample Data ─────────────────────────────────────────────────────────────
final _doctors = List.generate(
  4,
  (_) => const DoctorModel(
    name: 'د. عبد الرحمن عبد السلام',
    specialty: 'أخصائي أنف وأذن وحنجرة',
    rating: 4.6,
    reviewCount: 596,
    experienceYears: 15,
    services: [
      ServiceChip(
          type: ServiceType.clinic, location: 'كشف في العيادة', price: 300),
      ServiceChip(
          type: ServiceType.clinic,
          location: 'مصر الجديدة',
          subLocation: 'القاهرة'),
      ServiceChip(
          type: ServiceType.remote, location: 'استشارة عن بُعد', price: 150),
      ServiceChip(
          type: ServiceType.time, timeLabel: 'اليوم', timeValue: '6:00 م'),
    ],
  ),
);

// ─── Screen ──────────────────────────────────────────────────────────────────
class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});
  static String id = "DoctorsListScreen";

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.naturalLightGray3,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 12),
                  _buildFilterRow(),
                  const SizedBox(height: 12),
                  ..._doctors.map((d) => _DoctorCard(doctor: d)).toList(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_forward, color: AppColors.naturalBlack, size: 22),
          const Text(
            'قائمة الأطباء',
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold, color: AppColors.naturalBlack),
          ),
          const SizedBox(width: 22),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.naturalLightGray3),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: TextField(
        controller: _searchCtrl,
        textDirection: TextDirection.rtl,
        style: const TextStyle(fontSize: 14, color: AppColors.naturalBlack),
        decoration: const InputDecoration(
          hintText: 'ابحث باسم الطبيب',
          hintStyle: TextStyle(color: AppColors.naturalLightGray, fontSize: 14),
          hintTextDirection: TextDirection.rtl,
          prefixIcon: Icon(Icons.search, color: AppColors.naturalLightGray, size: 20),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildFilterRow() {
    return Row(
      children: [
        Expanded(child: _FilterButton(label: 'الترتيب')),
        const SizedBox(width: 12),
        Expanded(child: _FilterButton(label: 'التصنيف')),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  const _FilterButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.patientPrimaryLight4,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.patientPrimary.withOpacity(0.35)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.keyboard_arrow_down, color: AppColors.patientPrimary, size: 18),
          const SizedBox(width: 6),
          Text(label,
              style: const TextStyle(
                  color: AppColors.patientPrimary, fontSize: 14)),
        ],
      ),
    );
  }
}

// ─── Doctor Card ─────────────────────────────────────────────────────────────
class _DoctorCard extends StatefulWidget {
  final DoctorModel doctor;
  const _DoctorCard({required this.doctor});

  @override
  State<_DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<_DoctorCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.doctor;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        children: [
          // ── Top section ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(d.name,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.naturalBlack)),
                      const SizedBox(height: 4),
                      Text(d.specialty,
                          style: const TextStyle(fontSize: 13, color: AppColors.naturalLightGray)),
                      const SizedBox(height: 8),
                      // Rating
                      Row(
                        children: [
                          Text(
                            '${d.rating} تقييم عام من ${d.reviewCount} شخص',
                            style: const TextStyle(fontSize: 12, color: AppColors.naturalLightGray),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.star, color: AppColors.alertWarning, size: 15),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Experience
                      Row(
                        children: [
                          Text(
                            '${d.experienceYears}+ سنة خبرة',
                            style: const TextStyle(fontSize: 12, color: AppColors.naturalLightGray),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.work_outline,
                              color: AppColors.naturalLightGray, size: 14),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // Avatar
                Image.asset(
                  "assets/images/doctor.png",
                ),
              ],
            ),
          ),

          // ── Scrollable services row ───────────────────────────────────────
          _ServicesRow(services: d.services),

          const SizedBox(height: 2),

          // ── Bottom action row ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
            child: Row(
              children: [
                // Favourite
                _CircleIconBtn(
                  icon: _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.alertError,
                  onTap: () => setState(() => _isLiked = !_isLiked),
                ),
                const SizedBox(width: 10),
                // Share
                _CircleIconBtn(
                  icon: Icons.share_outlined,
                  color: AppColors.patientPrimary,
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                // Book button
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.patientPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      child: const Text(
                        'المتابعة إلى الحجز',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Horizontally scrollable services row ────────────────────────────────────
class _ServicesRow extends StatelessWidget {
  final List<ServiceChip> services;
  const _ServicesRow({required this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.naturalLightGray3),
          bottom: BorderSide(color: AppColors.naturalLightGray3),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true, // RTL scroll direction
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: services
              .map((s) => _buildChip(s))
              .expand((w) => [w, _buildChipDivider()])
              .toList()
            ..removeLast(), // remove trailing divider
        ),
      ),
    );
  }

  Widget _buildChipDivider() {
    return Container(
      width: 1,
      height: 44,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.naturalLightGray3,
    );
  }

  Widget _buildChip(ServiceChip s) {
    switch (s.type) {
      case ServiceType.clinic:
        if (s.price != null) {
          // Clinic examination chip
          return _ServiceItem(
            icon: _HospitalIcon(),
            topText: s.location!,
            bottomText: 'السعر: ${s.price} ج',
          );
        } else {
          // Location chip
          return _ServiceItem(
            icon:
                const Icon(Icons.location_on_outlined, color: AppColors.patientPrimary, size: 22),
            topText: s.location!,
            bottomText: s.subLocation ?? '',
          );
        }
      case ServiceType.remote:
        return _ServiceItem(
          icon: _PhoneConsultIcon(),
          topText: s.location!,
          bottomText: 'السعر: ${s.price} ج',
        );
      case ServiceType.time:
        return _ServiceItem(
          icon: const Icon(Icons.access_time_outlined, color: AppColors.patientPrimary, size: 22),
          topText: s.timeLabel!,
          bottomText: s.timeValue!,
        );
    }
  }
}

class _ServiceItem extends StatelessWidget {
  final Widget icon;
  final String topText;
  final String bottomText;

  const _ServiceItem({
    required this.icon,
    required this.topText,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(topText,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.naturalBlack)),
            Text(bottomText,
                style: const TextStyle(fontSize: 12, color: AppColors.naturalLightGray)),
          ],
        ),
      ],
    );
  }
}

// ─── Mini icons ───────────────────────────────────────────────────────────────
class _HospitalIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.patientPrimaryLight4,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.local_hospital_outlined, color: AppColors.patientPrimary, size: 22),
    );
  }
}

class _PhoneConsultIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.patientPrimaryLight4,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.phone_iphone_outlined, color: AppColors.patientPrimary, size: 22),
    );
  }
}

// ─── Circle icon button ───────────────────────────────────────────────────────
class _CircleIconBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _CircleIconBtn({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.naturalLightGray3),
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        child: Icon(icon, color: color, size: 22),
      ),
    );
  }
}
