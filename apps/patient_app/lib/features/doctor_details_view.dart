import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';

class DoctorDetailsView extends StatefulWidget {
  static const String id = 'DoctorDetailsView';

  const DoctorDetailsView({super.key});
  @override
  State<DoctorDetailsView> createState() => _DoctorDetailsViewState();
}

class _DoctorDetailsViewState extends State<DoctorDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.naturalLightGray3,
        body: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tab,
                children: const [
                  AboutTab(),
                  ClinicsTab(),
                  ReviewsTab(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBookButton(),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColors.patientPrimary,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_forward,
                      color: AppColors.naturalWhite, size: 22),
                  const Text('بيانات الطبيب',
                      style: TextStyle(
                          color: AppColors.naturalWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 22),
                ],
              ),
              const SizedBox(height: 16),
              // Doctor row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('د. عبد الرحمن عبد السلام',
                            style: TextStyle(
                                color: AppColors.naturalWhite,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('أخصائي أنف وأذن وحنجرة',
                            style: TextStyle(
                                color: AppColors.patientPrimaryLight4,
                                fontSize: 13)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Avatar
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.naturalWhite, width: 2),
                      color: AppColors.alertInformationLight,
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://i.pravatar.cc/150?img=12',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.person,
                            size: 36, color: AppColors.patientPrimary),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: AppColors.naturalWhite,
      child: TabBar(
        controller: _tab,
        labelColor: AppColors.patientPrimary,
        unselectedLabelColor: AppColors.naturalLightGray,
        indicatorColor: AppColors.patientPrimary,
        indicatorWeight: 2.5,
        labelStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
        unselectedLabelStyle:
            const TextStyle(fontSize: 14, fontFamily: 'Cairo'),
        tabs: const [
          Tab(text: 'عن الطبيب'),
          Tab(text: 'العيادات'),
          Tab(text: 'التقييمات'),
        ],
      ),
    );
  }

  Widget _buildBookButton() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: AppColors.naturalWhite,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.patientPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              elevation: 0,
            ),
            child: const Text('احجز الآن',
                style: TextStyle(
                    color: AppColors.naturalWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

// ─── About Tab ───────────────────────────────────────────────────────────────
class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Stats row
        _StatsRow(),
        const SizedBox(height: 16),
        // Professional Experience
        _SectionCard(
          icon: Icons.work_outline,
          title: 'الخبرة المهنية',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _BulletItem(
                  year: '2006 - 2000',
                  text: 'استشاري أنف وأذن وحنجرة\nمستشفى كليوباترا | القاهرة'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Academic Experience
        _SectionCard(
          icon: Icons.school_outlined,
          title: 'الخبرة الأكاديمية',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _BulletItem(
                  year: '2006 - 2000',
                  text:
                      'بكالريوس جراحة الأنف والأذن والحنجرة\nكلية طب القصر العيني | جامعة القاهرة'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Memberships
        _SectionCard(
          icon: Icons.badge_outlined,
          title: 'العضويات المهنية',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _BulletItem(
                  year: 'الآن - 2025',
                  text: 'زميل الكلية الملكية البريطانية للأطباء'),
              SizedBox(height: 6),
              _BulletItem(
                  year: '2024 - 2021',
                  text:
                      'الأمين العام للجمعية العربية لطب الأنف والأذن والحنجرة'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Sub-specialties
        _SectionCard(
          icon: Icons.local_hospital_outlined,
          title: 'التخصصات الفرعية',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _Chip(label: 'اضطرابات السمع والتوازن'),
              _Chip(label: 'سمعيات أطفال'),
              _Chip(label: 'اضط..'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Insurance
        _SectionCard(
          icon: Icons.shield_outlined,
          title: 'شركات التأمين',
          child: Row(
            children: [
              _InsuranceBadge(
                  label: 'نقابة المهندسين المصريين', icon: Icons.engineering),
              const SizedBox(width: 8),
              _InsuranceBadge(label: 'أكسا', icon: Icons.health_and_safety),
            ],
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatItem(
            icon: Icons.check_circle_outline,
            iconColor: AppColors.patientPrimary,
            value: '265',
            label: 'حجز مكتمل',
          ),
          _VertDivider(),
          _StatItem(
            icon: Icons.work_outline,
            iconColor: AppColors.patientPrimary,
            value: '15+',
            label: 'سنين الخبرة',
          ),
          _VertDivider(),
          _StatItem(
            icon: Icons.star,
            iconColor: AppColors.alertWarning,
            value: '4.6',
            label: 'تقييم عام',
          ),
        ],
      ),
    );
  }
}

class _VertDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 40, color: AppColors.naturalLightGray3);
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.naturalBlack)),
        Text(label,
            style: const TextStyle(
                fontSize: 11, color: AppColors.naturalLightGray)),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _SectionCard(
      {required this.icon, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.patientPrimary, size: 20),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.naturalBlack)),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _BulletItem extends StatelessWidget {
  final String year;
  final String text;

  const _BulletItem({required this.year, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6, left: 8),
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.patientPrimary),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(year,
                  style: const TextStyle(
                      fontSize: 11, color: AppColors.naturalLightGray)),
              Text(text,
                  style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.naturalBlack,
                      height: 1.5)),
            ],
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.patientPrimaryLight4,
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: AppColors.patientPrimary.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          style:
              const TextStyle(fontSize: 12, color: AppColors.patientPrimary)),
    );
  }
}

class _InsuranceBadge extends StatelessWidget {
  final String label;
  final IconData icon;

  const _InsuranceBadge({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.naturalLightGray3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.patientPrimary),
          const SizedBox(width: 6),
          Text(label,
              style:
                  const TextStyle(fontSize: 11, color: AppColors.naturalBlack)),
        ],
      ),
    );
  }
}

// ─── Clinics Tab ─────────────────────────────────────────────────────────────
class ClinicsTab extends StatelessWidget {
  const ClinicsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ClinicCard(),
        const SizedBox(height: 16),
        _RemoteConsultCard(),
        const SizedBox(height: 80),
      ],
    );
  }
}

class _ClinicCard extends StatefulWidget {
  @override
  State<_ClinicCard> createState() => _ClinicCardState();
}

class _ClinicCardState extends State<_ClinicCard> {
  bool _detailsExpanded = true;
  bool _addressExpanded = true;
  bool _hoursExpanded = true;
  bool _photosExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Clinic title
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Icon(Icons.local_hospital_outlined,
                    color: AppColors.patientPrimary, size: 20),
                SizedBox(width: 8),
                Text('عيادة التقوي',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.naturalBlack)),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.naturalLightGray3),

          // Examination Details
          _ExpandableSection(
            title: 'تفاصيل الكشف والمتابعة',
            icon: Icons.list_alt_outlined,
            expanded: _detailsExpanded,
            onToggle: () =>
                setState(() => _detailsExpanded = !_detailsExpanded),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('الكشف',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.naturalBlack)),
                ),
                Row(
                  children: const [
                    Expanded(
                        child: _DetailTile(
                            icon: Icons.calendar_today_outlined,
                            label: 'نوع الحجز',
                            value: 'بالأسبقية')),
                    SizedBox(width: 8),
                    Expanded(
                        child: _DetailTile(
                            icon: Icons.timer_outlined,
                            label: 'وقت الانتظار',
                            value: '15 د')),
                    SizedBox(width: 8),
                    Expanded(
                        child: _DetailTile(
                            icon: Icons.attach_money,
                            label: 'السعر',
                            value: '500 ج')),
                  ],
                ),
                const SizedBox(height: 14),
                const Text('المتابعة',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.naturalBlack)),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(
                        child: _DetailTile(
                            icon: Icons.video_call_outlined,
                            label: 'الوسيلة',
                            value: 'عيادة/عن بُعد')),
                    SizedBox(width: 8),
                    Expanded(
                        child: _DetailTile(
                            icon: Icons.date_range_outlined,
                            label: 'المدة',
                            value: '14 يوم')),
                    SizedBox(width: 8),
                    Expanded(
                        child: _DetailTile(
                            icon: Icons.money_off_outlined,
                            label: 'السعر',
                            value: 'مجاناً')),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.naturalLightGray3),

          // Address
          _ExpandableSection(
            title: 'العنوان',
            icon: Icons.location_on_outlined,
            expanded: _addressExpanded,
            onToggle: () =>
                setState(() => _addressExpanded = !_addressExpanded),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('شارع عباس العقاد - مدينة نصر - القاهرة',
                    style:
                        TextStyle(fontSize: 13, color: AppColors.naturalBlack)),
                const SizedBox(height: 8),
                _AddressRow(icon: Icons.info_outline, text: 'احجز الآن وسيصلك'),
                const SizedBox(height: 6),
                _AddressRow(
                    icon: Icons.map_outlined,
                    text: 'العنوان بالتفصيل ورابط الموقع على الخريطة'),
                const SizedBox(height: 6),
                _AddressRow(icon: Icons.phone_outlined, text: 'رقم العيادة'),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.naturalLightGray3),

          // Working Hours
          _ExpandableSection(
            title: 'مواعيد العمل',
            icon: Icons.access_time_outlined,
            expanded: _hoursExpanded,
            onToggle: () => setState(() => _hoursExpanded = !_hoursExpanded),
            child: _WorkingHoursTable(hours: const {
              'الأحد': 'من 8:00 ص - إلى 5:00 م',
              'الإثنين': 'لا توجد مواعيد متاحة',
              'الثلاثاء': 'من 8:00 ص - إلى 5:00 م',
              'الأربعاء': 'من 8:00 ص - إلى 5:00 م',
              'الخميس': 'من 8:00 ص - إلى 5:00 م',
              'الجمعة': 'لا توجد مواعيد متاحة',
              'السبت': 'من 8:00 ص - إلى 5:00 م',
            }),
          ),
          const Divider(height: 1, color: AppColors.naturalLightGray3),

          // Clinic Photos
          _ExpandableSection(
            title: 'صور العيادة',
            icon: Icons.photo_library_outlined,
            expanded: _photosExpanded,
            onToggle: () => setState(() => _photosExpanded = !_photosExpanded),
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 110,
                    color: AppColors.alertSuccessLight,
                    child: const Icon(Icons.image_outlined,
                        color: AppColors.patientPrimary, size: 36),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RemoteConsultCard extends StatefulWidget {
  @override
  State<_RemoteConsultCard> createState() => _RemoteConsultCardState();
}

class _RemoteConsultCardState extends State<_RemoteConsultCard> {
  bool _detailsExpanded = true;
  bool _hoursExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Icon(Icons.phone_iphone_outlined,
                    color: AppColors.patientPrimary, size: 20),
                SizedBox(width: 8),
                Text('استشارات عن بُعد',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.naturalBlack)),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.naturalLightGray3),
          _ExpandableSection(
            title: 'تفاصيل استشارة',
            icon: Icons.list_alt_outlined,
            expanded: _detailsExpanded,
            onToggle: () =>
                setState(() => _detailsExpanded = !_detailsExpanded),
            child: Row(
              children: const [
                Expanded(
                    child: _DetailTile(
                        icon: Icons.call_outlined,
                        label: 'نوع المكالمة',
                        value: 'صوتية / مرئية')),
                SizedBox(width: 8),
                Expanded(
                    child: _DetailTile(
                        icon: Icons.timer_outlined,
                        label: 'مدة الاستشارة',
                        value: '20 د')),
                SizedBox(width: 8),
                Expanded(
                    child: _DetailTile(
                        icon: Icons.attach_money,
                        label: 'سعر الاستشارة',
                        value: '200 ج')),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.naturalLightGray3),
          _ExpandableSection(
            title: 'مواعيد العمل',
            icon: Icons.access_time_outlined,
            expanded: _hoursExpanded,
            onToggle: () => setState(() => _hoursExpanded = !_hoursExpanded),
            child: _WorkingHoursTable(hours: const {
              'الأحد': 'من 8:00 ص - إلى 5:00 م',
              'الإثنين': 'لا توجد مواعيد متاحة',
              'الثلاثاء': 'من 8:00 ص - إلى 5:00 م',
              'الأربعاء': 'من 8:00 ص - إلى 5:00 م',
              'الخميس': 'من 8:00 ص - إلى 5:00 م',
              'الجمعة': 'لا توجد مواعيد متاحة',
              'السبت': 'من 8:00 ص - إلى 5:00 م',
            }),
          ),
        ],
      ),
    );
  }
}

class _ExpandableSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool expanded;
  final VoidCallback onToggle;
  final Widget child;

  const _ExpandableSection({
    required this.title,
    required this.icon,
    required this.expanded,
    required this.onToggle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onToggle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(
                    expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.naturalLightGray,
                    size: 20),
                const Spacer(),
                Text(title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.naturalBlack)),
                const SizedBox(width: 8),
                Icon(icon, color: AppColors.patientPrimary, size: 18),
              ],
            ),
          ),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: child,
          ),
      ],
    );
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.patientPrimaryLight4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.patientPrimary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.patientPrimary, size: 18),
          ),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.naturalBlack),
              textAlign: TextAlign.center),
          Text(label,
              style: const TextStyle(
                  fontSize: 10, color: AppColors.naturalLightGray),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _AddressRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _AddressRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.patientPrimary),
        const SizedBox(width: 8),
        Expanded(
            child: Text(text,
                style: const TextStyle(
                    fontSize: 12, color: AppColors.naturalLightGray))),
      ],
    );
  }
}

class _WorkingHoursTable extends StatelessWidget {
  final Map<String, String> hours;
  const _WorkingHoursTable({required this.hours});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: hours.entries.map((e) {
        final unavailable = e.value.contains('لا توجد');
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Text(e.value,
                  style: TextStyle(
                      fontSize: 12,
                      color: unavailable
                          ? AppColors.naturalLightGray
                          : AppColors.naturalBlack)),
              const Spacer(),
              Text(e.key,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.naturalBlack)),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ─── Reviews Tab ─────────────────────────────────────────────────────────────
class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Rating summary
        _RatingSummary(),
        const SizedBox(height: 16),
        // Review list header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.naturalWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.star_outline,
                      color: AppColors.patientPrimary, size: 20),
                  SizedBox(width: 8),
                  Text('التقييمات',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.naturalBlack)),
                  SizedBox(width: 4),
                  Text('(134)',
                      style: TextStyle(
                          fontSize: 13, color: AppColors.naturalLightGray)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.sort,
                          size: 15, color: AppColors.naturalBlack),
                      label: const Text('الترتيب',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.naturalBlack)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: AppColors.naturalLightGray3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list,
                          size: 15, color: AppColors.naturalBlack),
                      label: const Text('التصنيف',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.naturalBlack)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: AppColors.naturalLightGray3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Divider(color: AppColors.naturalLightGray3),
              _ReviewItem(
                name: 'إبراهيم أ...',
                type: 'كشف ق العيادة',
                daysAgo: 'منذ 9 أيام',
                stars: 5,
                review:
                    'دكتور محترم وأستفدت جداً من الكشف ربنا يجازيه خير وساعدني أخف بعد فترة من المعاناة مع المرض والتف على الداكترة علشان كنت كل مره..',
                hasMore: true,
              ),
              const Divider(color: AppColors.naturalLightGray3),
              _ReviewItem(
                name: 'إبراهيم أ...',
                type: 'كشف ق العيادة',
                daysAgo: 'منذ 3 أيام',
                stars: 4,
                review: 'دكتور محترم وأستفدت جداً من الكشف.',
                hasMore: false,
              ),
              const Divider(color: AppColors.naturalLightGray3),
              _ReviewItem(
                name: 'إبراهيم أ...',
                type: 'استشارة عن بُعد',
                daysAgo: 'منذ 7 أيام',
                stars: 5,
                review:
                    'دكتور محترم وأستفدت جداً من الكشف ربنا يجازيه خير وساعدني أخف بعد فترة من المعاناة مع المرض والتف على الداكترة.',
                hasMore: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}

class _RatingSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _RatingBlock(value: '4.9', label: 'تقييم الاستشارات'),
          _VertDivider(),
          _RatingBlock(value: '4.1', label: 'تقييم الكشوفات'),
          _VertDivider(),
          _RatingBlock(value: '4.6', label: 'تقييم عام'),
        ],
      ),
    );
  }
}

class _RatingBlock extends StatelessWidget {
  final String value;
  final String label;

  const _RatingBlock({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.star, color: AppColors.alertWarning, size: 28),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.naturalBlack)),
        Text(label,
            style: const TextStyle(
                fontSize: 11, color: AppColors.naturalLightGray),
            textAlign: TextAlign.center),
      ],
    );
  }
}

class _ReviewItem extends StatelessWidget {
  final String name;
  final String type;
  final String daysAgo;
  final int stars;
  final String review;
  final bool hasMore;

  const _ReviewItem({
    required this.name,
    required this.type,
    required this.daysAgo,
    required this.stars,
    required this.review,
    required this.hasMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(daysAgo,
                  style: const TextStyle(
                      fontSize: 11, color: AppColors.naturalLightGray)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.naturalBlack)),
                  Text(type,
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.naturalLightGray)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              5,
              (i) => Icon(
                i < stars ? Icons.star : Icons.star_border,
                color: AppColors.alertWarning,
                size: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Review text
          RichText(
            textDirection: TextDirection.rtl,
            text: TextSpan(
              style: const TextStyle(
                  fontSize: 13, color: AppColors.naturalBlack, height: 1.5),
              children: [
                TextSpan(text: review),
                if (hasMore)
                  const TextSpan(
                    text: ' عرض المزيد',
                    style: TextStyle(
                        color: AppColors.patientPrimary,
                        fontWeight: FontWeight.w600),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
