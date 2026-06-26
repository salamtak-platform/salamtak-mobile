import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/text_styles.dart';

class HakimAiView extends StatefulWidget {
  const HakimAiView({super.key});

  static const String id = "HakimAiView";

  @override
  State<HakimAiView> createState() => _HakimAiViewState();
}

class _HakimAiViewState extends State<HakimAiView> {
  static const Color _bubbleGrey = Color(0xfff0f0f0);
  static const Color _divider = Color(0xffe0e5e3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _HakimHeader(),
            const SizedBox(height: 24),
            const _DateDivider(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                children: const [
                  _UserMessage(
                    time: "اليوم 2:16 م",
                    message: "ما هي المادة الفعالة لدواء بنادول",
                  ),
                  SizedBox(height: 32),
                  _BotMessage(
                    time: "اليوم 2:15 م",
                    message:
                        "أهلاً بك! أنا حكيم AI وجاهز لمساعدتك في أي وقت.\nالمادة الفعالة لدواء بنادول هي باراسيتامول، هل تريد معرفة أية معلومات أخرى عن الجرعات، التحذيرات، أو دواعي الاستعمال؟",
                  ),
                  SizedBox(height: 32),
                  _UserMessage(
                    time: "اليوم 2:16 م",
                    message: "شات جي بي تي أحسن منك",
                    maxWidthFactor: .55,
                  ),
                  SizedBox(height: 32),
                  _TypingMessage(),
                ],
              ),
            ),
            const _Composer(),
            const _BottomNav(),
          ],
        ),
      ),
    );
  }
}

class _HakimHeader extends StatelessWidget {
  const _HakimHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 18, 32, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline_rounded),
            color: AppColors.naturalDarkGrey,
            iconSize: 30,
            tooltip: "المحادثات",
          ),
          const _LanguageSwitch(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
            color: AppColors.naturalDarkGrey,
            iconSize: 34,
            tooltip: "القائمة",
          ),
        ],
      ),
    );
  }
}

class _LanguageSwitch extends StatelessWidget {
  const _LanguageSwitch();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.patientPrimaryLight4,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "🇺🇸 English",
            style: TextStyle(
              color: AppColors.naturalDarkGrey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.patientPrimary,
              borderRadius: BorderRadius.circular(22),
            ),
            alignment: Alignment.center,
            child: const Text(
              "العربية 🇪🇬",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DateDivider extends StatelessWidget {
  const _DateDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(child: Divider(color: _HakimAiViewState._divider)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "اليوم",
              style: TextStyle(
                color: AppColors.naturalLightGray,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Divider(color: _HakimAiViewState._divider)),
        ],
      ),
    );
  }
}

class _UserMessage extends StatelessWidget {
  const _UserMessage({
    required this.time,
    required this.message,
    this.maxWidthFactor = .72,
  });

  final String time;
  final String message;
  final double maxWidthFactor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth * maxWidthFactor,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "أنت",
                    style: AppTextStyles().bodyMed,
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: AppColors.naturalDarkGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 18,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.patientPrimary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message,
                      textAlign: TextAlign.right,
                      style: AppTextStyles()
                          .bodyMed
                          .copyWith(color: Colors.white, height: 1.30),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BotMessage extends StatelessWidget {
  const _BotMessage({
    required this.time,
    required this.message,
  });

  final String time;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: _HakimAvatar(),
        ),
        const SizedBox(width: 22),
        Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Text("حكيم AI",
                        style: AppTextStyles().bodyMed.copyWith(
                              color: AppColors.naturalDarkGrey,
                            )),
                    const Spacer(),
                    Text(
                      time,
                      style: const TextStyle(
                        color: AppColors.naturalDarkGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(28, 22, 28, 22),
                  decoration: const BoxDecoration(
                    color: _HakimAiViewState._bubbleGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    message,
                    textAlign: TextAlign.right,
                    style: AppTextStyles().bodyMed.copyWith(height: 1.30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TypingMessage extends StatelessWidget {
  const _TypingMessage();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _HakimAvatar(size: 56),
        const SizedBox(width: 22),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "حكيم AI",
              style: TextStyle(
                color: AppColors.naturalDarkGrey,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 56,
              width: 80,
              decoration: BoxDecoration(
                color: _HakimAiViewState._bubbleGrey,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _TypingDot(),
                  SizedBox(width: 8),
                  _TypingDot(),
                  SizedBox(width: 8),
                  _TypingDot(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TypingDot extends StatelessWidget {
  const _TypingDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height: 7,
      decoration: const BoxDecoration(
        color: AppColors.naturalLightGray,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _HakimAvatar extends StatelessWidget {
  const _HakimAvatar({this.size = 68});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              color: AppColors.patientPrimary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: CustomPaint(
              size: Size(size * .68, size * .38),
              painter: _HeartbeatPainter(),
            ),
          ),
          Positioned(
            right: -2,
            bottom: -1,
            child: Container(
              width: size * .32,
              height: size * .32,
              decoration: BoxDecoration(
                color: AppColors.alertSuccess,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.naturalWhite,
                  width: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeartbeatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(0, size.height * .68)
      ..lineTo(size.width * .18, size.height * .68)
      ..lineTo(size.width * .28, size.height * .18)
      ..lineTo(size.width * .39, size.height * .92)
      ..lineTo(size.width * .52, size.height * .3)
      ..lineTo(size.width * .63, size.height * .68)
      ..lineTo(size.width, size.height * .68);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Composer extends StatelessWidget {
  const _Composer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: _HakimAiViewState._divider),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 68,
              child: TextField(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: "اسأل حكيم AI",
                  hintStyle: const TextStyle(
                    color: AppColors.naturalLightGray,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                  filled: true,
                  fillColor: AppColors.naturalWhite,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: AppColors.naturalLightGray2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: AppColors.patientPrimary,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 68,
            height: 68,
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.patientPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: EdgeInsets.zero,
              ),
              child: const FaIcon(
                FontAwesomeIcons.solidPaperPlane,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 8),
      decoration: BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .12),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              Expanded(
                child: _NavItem(
                  icon: Icons.description_outlined,
                  label: "السجل الطبي",
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: Icons.alarm_rounded,
                  label: "التذكيرات",
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: Icons.chat_bubble_rounded,
                  label: "حكيم AI",
                  selected: true,
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: Icons.calendar_today_outlined,
                  label: "الأنشطة",
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: Icons.home_outlined,
                  label: "الرئيسية",
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            width: 270,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.naturalBlack,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final color =
        selected ? AppColors.patientPrimary : AppColors.naturalLightGray;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 5,
          width: selected ? 64 : 0,
          decoration: BoxDecoration(
            color: selected ? AppColors.patientPrimary : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
