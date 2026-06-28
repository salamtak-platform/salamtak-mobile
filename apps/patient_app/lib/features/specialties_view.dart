import 'package:flutter/material.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/features/auth/views/home_view.dart';
import 'package:patient_app/text_styles.dart';

class Specialty {
  final String name;

  const Specialty({required this.name});
}

class SpecialtiesView extends StatefulWidget {
  static String id = "SpecialtiesView";

  const SpecialtiesView({super.key});

  @override
  State<SpecialtiesView> createState() => SpecialtiesViewState();
}

class SpecialtiesViewState extends State<SpecialtiesView> {
  final TextEditingController searchController = TextEditingController();
  final List<Specialty> allSpecialties = const [
    Specialty(name: 'طب أطفال'),
    Specialty(name: 'طب نساء وولادة'),
    Specialty(name: 'جراحة عامة'),
    Specialty(name: 'طب عيون'),
    Specialty(name: 'طب أنف وأذن وحنجرة'),
    Specialty(name: 'طب نفسي'),
    Specialty(name: 'جراحة عظام'),
    Specialty(name: 'أمراض جلدية'),
    Specialty(name: 'طب باطني'),
    Specialty(name: 'طب أعصاب'),
    Specialty(name: 'أمراض الجهاز الهضمي'),
    Specialty(name: 'طب القلب والأوعية الدموية'),
    Specialty(name: 'طب الطوارئ'),
    Specialty(name: 'طب الأورام'),
  ];

  List<Specialty> filtered = [];

  @override
  void initState() {
    super.initState();
    filtered = allSpecialties;
    searchController.addListener(onSearch);
  }

  void onSearch() {
    final query = searchController.text.trim();
    setState(() {
      filtered = query.isEmpty
          ? allSpecialties
          : allSpecialties.where((s) => s.name.contains(query)).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
              buildHeader(context),
              buildSearchBar(),
              const SizedBox(height: 8),
              Expanded(
                child:
                    filtered.isEmpty ? buildEmptyState() : buildSpecialtyList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back arrow (→ in RTL acts as forward/skip)
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_forward,
                color: AppColors.naturalBlack,
                size: 22,
              ),
            ),
          ),
          Text(
            'اختر التخصص',
            style: HomeView.bodyStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Spacer to balance layout
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.naturalLightGray, width: 1.4),
        ),
        child: TextField(
          controller: searchController,
          textDirection: TextDirection.rtl,
          style: HomeView.bodyStyle(
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintText: 'ابحث بالتخصص',
            hintStyle: HomeView.bodyStyle(
              color: AppColors.naturalLightGray,
              fontSize: 15,
            ),
            hintTextDirection: TextDirection.rtl,
            icon: const Icon(
              Icons.search,
              color: AppColors.naturalLightGray,
              size: 24,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget buildSpecialtyList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: filtered.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        thickness: 1,
        color: AppColors.naturalLightGray2,
        indent: 0,
        endIndent: 0,
      ),
      itemBuilder: (context, index) {
        return SpecialtyTile(specialty: filtered[index]);
      },
    );
  }

  Widget buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, size: 48, color: AppColors.naturalLightGray),
          SizedBox(height: 12),
          Text(
            'لا توجد نتائج',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.naturalLightGray,
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialtyTile extends StatelessWidget {
  final Specialty specialty;

  const SpecialtyTile({required this.specialty});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to specialty details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم اختيار: ${specialty.name}'),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.patientPrimary,
          ),
        );
      },
      splashColor: AppColors.patientPrimary.withOpacity(0.08),
      highlightColor: AppColors.patientPrimary.withOpacity(0.04),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            // Text on the right (RTL)
            Expanded(
              child: Text(
                specialty.name,
                style: HomeView.bodyStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(width: 12),
            // Doctor icon on the left (RTL leading)
            DoctorIcon(),
          ],
        ),
      ),
    );
  }
}

/// Custom painted doctor/specialist icon
class DoctorIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      child: CustomPaint(
        size: const Size(32, 32),
        painter: DoctorIconPainter(),
      ),
    );
  }
}

class DoctorIconPainter extends CustomPainter {
  static const Color primary = AppColors.patientPrimary;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = primary;

    final double cx = size.width / 2;

    // Head circle
    canvas.drawCircle(Offset(cx, size.height * 0.22), size.width * 0.17, paint);

    // Body / shoulders
    final bodyPath = Path();
    bodyPath.moveTo(cx - size.width * 0.36, size.height * 0.95);
    bodyPath.quadraticBezierTo(
      cx - size.width * 0.36,
      size.height * 0.55,
      cx,
      size.height * 0.47,
    );
    bodyPath.quadraticBezierTo(
      cx + size.width * 0.36,
      size.height * 0.55,
      cx + size.width * 0.36,
      size.height * 0.95,
    );
    bodyPath.close();
    canvas.drawPath(bodyPath, paint);

    // Stethoscope outline (small cross on chest)
    final crossPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Vertical bar
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, size.height * 0.68),
          width: size.width * 0.08,
          height: size.height * 0.18,
        ),
        const Radius.circular(2),
      ),
      crossPaint,
    );
    // Horizontal bar
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, size.height * 0.68),
          width: size.width * 0.18,
          height: size.height * 0.08,
        ),
        const Radius.circular(2),
      ),
      crossPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
