import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/assets/app_colors.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Widget pushView;
  final String status;
  final bool isLeftIcon;
  final bool isRightIcon;

  MainButton({
    super.key,
    required this.title,
    required this.pushView,
    required this.status,
    required this.isLeftIcon,
    required this.isRightIcon,
  });

  List<Color> getColor(String status) {
    List<Color> colors = [];
    if (status == "primary" || status == "secondary strocked") {
      colors.add(AppColors.patientPrimary);
      colors.add(AppColors.naturalWhite);
    } else if (status == "secondary") {
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return pushView;
            },
          ),
        );
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: colors[0],
          borderRadius: BorderRadius.circular(8),
          border: status == "secondary strocked"
              ? Border.all(color: AppColors.naturalWhite, width: 2)
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
                    fontWeight: FontWeight(500),
                    color: colors[1],
                  ),
                ),
        ),
      ),
    );
  }
}
