import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const Color _navShadow = Color(0x1f000f0f);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
      decoration: const BoxDecoration(
        color: AppColors.naturalWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: _navShadow,
            blurRadius: 18,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _NavItem(
                  icon: FontAwesomeIcons.fileLines,
                  label: 'السجل الطبي',
                  selected: currentIndex == 4,
                  onTap: () => onTap(4),
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: FontAwesomeIcons.alarmClock,
                  label: 'التذكيرات',
                  selected: currentIndex == 3,
                  onTap: () => onTap(3),
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: FontAwesomeIcons.solidCommentDots,
                  label: 'حكيم AI',
                  selected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: FontAwesomeIcons.calendar,
                  label: 'الأنشطة',
                  selected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
              ),
              Expanded(
                child: _NavItem(
                  icon: FontAwesomeIcons.house,
                  label: 'الرئيسية',
                  selected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 134,
            height: 4,
            margin: const EdgeInsets.only(bottom: 9),
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
    required this.selected,
    required this.onTap,
  });

  final FaIconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color =
        selected ? AppColors.patientPrimary : AppColors.naturalLightGray;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, color: color, size: 22),
          const SizedBox(height: 5),
          Text(
            label,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: color,
              fontFamily: 'Baloo Bhaijaan 2',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 7),
          SizedBox(
            width: 68,
            height: 3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: selected ? AppColors.patientPrimary : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
