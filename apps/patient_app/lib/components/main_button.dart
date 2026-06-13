import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';

class MainButton extends StatelessWidget {
  final String title;
  final String status;
  final bool isLeftIcon;
  final bool isRightIcon;
  final String route;

  const MainButton({
    super.key,
    required this.title,
    required this.status,
    required this.isLeftIcon,
    required this.isRightIcon,
    required this.route,
  });

  List<Color> getColor(String status) {
    List<Color> colors = [];
    if (status == "primary") {
      colors.add(AppColors.patientPrimary);
      colors.add(AppColors.naturalWhite);
    } else if (status == "secondary" || status == "secondary strocked") {
      colors.add(AppColors.naturalWhite);
      colors.add(AppColors.patientPrimary);
    }
    return colors;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = getColor(status);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: colors[0],
          borderRadius: BorderRadius.circular(8),
          border: status == "secondary strocked"
              ? Border.all(color: colors[1], width: 1)
              : null,
        ),
        child: Center(
          child: isLeftIcon
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          title,
                          style: TextStyle(
                            fontFamily: "Baloo Bhaijaan 2",
                            fontSize: 20,
                            package: 'ui_kit',
                            fontWeight: FontWeight(500),
                            color: colors[1],
                          ),
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        color: colors[1],
                        weight: 24,
                      ),
                    ],
                  ),
                )
              : isRightIcon
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: colors[1],
                            weight: 24,
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              title,
                              style: TextStyle(
                                fontFamily: "Baloo Bhaijaan 2",
                                fontSize: 20,
                                package: 'ui_kit',
                                fontWeight: FontWeight(500),
                                color: colors[1],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        fontFamily: "Baloo Bhaijaan 2",
                        fontSize: 20,
                        package: 'ui_kit',
                        fontWeight: FontWeight(500),
                        color: colors[1],
                      ),
                    ),
        ),
      ),
    );
  }
}
