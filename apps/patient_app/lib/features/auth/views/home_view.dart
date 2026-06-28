import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';

import '../../specialties_view.dart';

class HomeView extends StatelessWidget {
  static String id = "HomeView";
  const HomeView({super.key});

  static const _fontFamily = 'Baloo Bhaijaan 2';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _HomeHeader(),
              const SizedBox(height: 18),
              const _SearchField(),
              const SizedBox(height: 24),
              Text(
                'سلامتك يا أحمد!',
                textAlign: TextAlign.right,
                style: _titleStyle(fontSize: 24),
              ),
              const SizedBox(height: 4),
              Text(
                'جاهز تطمن على صحتك؟',
                textAlign: TextAlign.right,
                style: bodyStyle(
                  color: AppColors.naturalDarkGrey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 24),
              const _AppointmentCard(),
              const SizedBox(height: 24),
              const _SectionTitle(title: 'الخدمات المتاحة'),
              const SizedBox(height: 14),
              _ServicesGrid(),
              const SizedBox(height: 22),
              const _SectionHeader(title: 'الأطباء الأكثر اختياراً'),
              const SizedBox(height: 12),
              const _DoctorsList(),
              const SizedBox(height: 22),
              const _SectionHeader(title: 'أشهر التخصصات'),
              const SizedBox(height: 12),
              _SpecialtiesGrid(),
            ],
          ),
        ),
      ),
    );
  }

  static TextStyle _titleStyle({double fontSize = 22, Color? color}) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.naturalBlack,
    );
  }

  static TextStyle bodyStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColors.naturalBlack,
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.ltr,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_rounded, size: 28),
        ),
        const Spacer(),
        Image.asset(
          // This should be inside a SafeArea
          'assets/images/patient_logo.png',
          width: 42,
          height: 42,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded, size: 32),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.naturalLightGray, width: 1.4),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search_rounded,
            color: AppColors.naturalLightGray,
            size: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'ابحث بالتخصص، اسم الطبيب، الدواء، ...',
              overflow: TextOverflow.ellipsis,
              style: HomeView.bodyStyle(
                color: AppColors.naturalLightGray,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.patientPrimary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'الموعد التالي',
                style: HomeView._titleStyle(
                  fontSize: 22,
                  color: AppColors.naturalWhite,
                ),
              ),
              const Spacer(),
              Text(
                'عرض التفاصيل',
                style: HomeView.bodyStyle(
                  fontSize: 18,
                  color: AppColors.naturalWhite,
                ),
              ),
              const SizedBox(width: 8),
              const FaIcon(
                FontAwesomeIcons.chevronLeft,
                size: 20,
                color: AppColors.naturalWhite,
              ),
            ],
          ),
          const SizedBox(height: 12),
          IntrinsicHeight(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(
                    flex: 5,
                    child: _DoctorCard(compact: false),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: const [
                        _AppointmentInfo(
                          icon: Icons.local_hospital_rounded,
                          label: 'كشف في العيادة',
                        ),
                        SizedBox(height: 10),
                        _AppointmentInfo(
                          icon: Icons.calendar_month_rounded,
                          label: 'الأحد 20 فبراير',
                        ),
                        SizedBox(height: 10),
                        _AppointmentInfo(
                          icon: Icons.access_time_filled_rounded,
                          label: '8:30 مساءً',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentInfo extends StatelessWidget {
  const _AppointmentInfo({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.naturalWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.patientPrimary, size: 24),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: HomeView.bodyStyle(
                  color: AppColors.patientPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.right,
      style: HomeView._titleStyle(fontSize: 24),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: HomeView._titleStyle(fontSize: 22)),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SpecialtiesView.id),
          child: Row(
            children: [
              Text(
                'عرض الكل',
                style: HomeView.bodyStyle(
                  color: AppColors.naturalDarkGrey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 4),
              const FaIcon(FontAwesomeIcons.chevronLeft,
                  size: 20, color: AppColors.naturalDarkGrey),
            ],
          ),
        ),
      ],
    );
  }
}

class _ServicesGrid extends StatefulWidget {
  _ServicesGrid();

  @override
  State<_ServicesGrid> createState() => _ServicesGridState();
}

class _ServicesGridState extends State<_ServicesGrid> {
  List<_ServiceItem> _getServices(BuildContext context) {
    return [
      _ServiceItem(
          title: 'حجز كشف في\nالعيادة',
          imagePath: 'assets/images/doctor.png',
          disabled: false,
          onTap: () => Navigator.pushNamed(context, SpecialtiesView.id)),
      _ServiceItem(
          title: 'طلب مستلزمات\nالصيدلية',
          imagePath: 'assets/images/pharmacy.png',
          disabled: false),
      _ServiceItem(
          title: 'حجز استشارة\nعن بعد',
          imagePath: 'assets/images/online_consultation.png',
          disabled: false,
          onTap: () => Navigator.pushNamed(context, SpecialtiesView.id)),
      _ServiceItem(
          title: 'حجز تحليل',
          imagePath: 'assets/images/lab_test.png',
          disabled: false),
      _ServiceItem(
          title: 'حجز أشعة',
          imagePath: 'assets/images/scan.png',
          disabled: false),
      _ServiceItem(
          title: 'خدمات أخرى\nقريباً',
          imagePath: 'assets/images/sand_clock.png',
          disabled: true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final services = _getServices(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: .82,
      ),
      itemBuilder: (context, index) {
        final service = services[index];
        return _ServiceTile(service: service);
      },
    );
  }
}

class _ServiceItem {
  const _ServiceItem(
      {required this.title,
      required this.imagePath,
      required this.disabled,
      this.onTap});

  final String title;
  final String imagePath;
  final bool disabled;
  final VoidCallback? onTap;
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({required this.service});

  final _ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: service.disabled ? null : service.onTap,
      borderRadius: BorderRadius.circular(8),
      splashColor: AppColors.patientPrimary.withOpacity(0.1),
      highlightColor: AppColors.patientPrimary.withOpacity(0.05),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: service.disabled
              ? AppColors.naturalLightGray3
              : AppColors.naturalWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.naturalLightGray2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(service.imagePath),
            const SizedBox(height: 12),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  service.title,
                  textAlign: TextAlign.center,
                  style: HomeView.bodyStyle(
                    color: service.disabled
                        ? AppColors.naturalLightGray
                        : AppColors.naturalBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorsList extends StatelessWidget {
  const _DoctorsList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 178,
      child: ListView.separated(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => const SizedBox(
          width: 132,
          child: _DoctorCard(),
        ),
      ),
    );
  }
}

class _DoctorCard extends StatelessWidget {
  const _DoctorCard({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.naturalLightGray2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      "assets/images/profile_picture.jpeg",
                      package: "ui_kit",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 4,
                  bottom: 4,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.patientPrimary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.alertWarning,
                          size: 17,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '4.9',
                          style: HomeView.bodyStyle(
                            color: AppColors.naturalWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'د. مختار نبيل',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: HomeView.bodyStyle(
              fontSize: compact ? 16 : 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'أخصائي أنف وأذن و...',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: HomeView.bodyStyle(
              color: AppColors.naturalDarkGrey,
              fontSize: compact ? 13 : 15,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecialtyItem {
  const _SpecialtyItem(this.title, this.icon);
  final String title;
  final IconData icon;
}

class _SpecialtiesGrid extends StatelessWidget {
  _SpecialtiesGrid();

  final List<_SpecialtyItem> specialties = const [
    _SpecialtyItem('جلدية', Icons.back_hand_rounded),
    _SpecialtyItem('أسنان', Icons.health_and_safety_rounded),
    _SpecialtyItem('نفسي', Icons.psychology_rounded),
    _SpecialtyItem('أطفال وحديثي ا...', Icons.child_care_rounded),
    _SpecialtyItem('عظام', Icons.accessibility_new_rounded),
    _SpecialtyItem('نساء وتوليد', Icons.pregnant_woman_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specialties.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.45,
      ),
      itemBuilder: (context, index) {
        final item = specialties[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: AppColors.naturalWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.naturalLightGray2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(item.icon, color: AppColors.patientPrimary, size: 28),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: HomeView.bodyStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
