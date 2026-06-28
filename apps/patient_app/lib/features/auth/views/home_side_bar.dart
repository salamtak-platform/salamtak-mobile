import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = const AppTextStyles();

    return Scaffold(
      backgroundColor: AppColors.naturalWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 8),

                    /// Header
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor: AppColors.patientPrimary,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile.png',
                              width: 84,
                              height: 84,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'مختار نبيل',
                                style: textStyles.headerSb.copyWith(
                                  color: AppColors.naturalBlack,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '+201101748531',
                                style: textStyles.titleMed.copyWith(
                                  color: AppColors.naturalDarkGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 36),

                    _MenuTile(
                      icon: FontAwesomeIcons.bookmark,
                      title: 'المفضلة',
                      onTap: () {},
                    ),
                    _MenuTile(
                      icon: FontAwesomeIcons.locationDot,
                      title: 'العناوين',
                      onTap: () {},
                    ),
                    _MenuTile(
                      icon: FontAwesomeIcons.gear,
                      title: 'الإعدادات',
                      onTap: () {},
                    ),

                    const SizedBox(height: 12),

                    Divider(
                      color: AppColors.naturalLightGray2,
                    ),

                    const SizedBox(height: 12),

                    _MenuTile(
                      icon: FontAwesomeIcons.circleQuestion,
                      title: 'الأسئلة الشائعة',
                      onTap: () {},
                    ),
                    _MenuTile(
                      icon: FontAwesomeIcons.headset,
                      title: 'مركز الدعم',
                      onTap: () {},
                    ),
                    _MenuTile(
                      icon: FontAwesomeIcons.solidNewspaper,
                      title: 'شروط الخدمة',
                      onTap: () {},
                    ),
                    _MenuTile(
                      icon: FontAwesomeIcons.lock,
                      title: 'سياسة الخصوصية',
                      onTap: () {},
                    ),

                    const SizedBox(height: 12),

                    Divider(
                      color: AppColors.naturalLightGray2,
                    ),

                    const SizedBox(height: 12),

                    _MenuTile(
                      icon: FontAwesomeIcons.solidStar,
                      title: 'قيم التطبيق',
                      onTap: () {},
                    ),
                    _MenuTile(
                      icon: FontAwesomeIcons.shareNodes,
                      title: 'شارك التطبيق',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            /// Footer
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 24,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_logo.png',
                        height: 72,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'تطبيق سلامتك',
                            style: textStyles.titleMed.copyWith(
                              color: AppColors.patientPrimary,
                            ),
                          ),
                          Text(
                            'Salamtak App',
                            style: textStyles.titleMed.copyWith(
                              color: AppColors.patientPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'جميع الحقوق محفوظة © 2026',
                    style: textStyles.bodyReg.copyWith(
                      color: AppColors.naturalDarkGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'V 1.0',
                    style: textStyles.subBodyReg.copyWith(
                      color: AppColors.naturalDarkGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final FaIconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textStyles = const AppTextStyles();

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        child: Row(
          children: [
            FaIcon(
              icon,
              color: AppColors.patientPrimary,
              size: 24,
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.end,
                style: textStyles.titleMed.copyWith(
                  color: AppColors.naturalBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
