import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patient_app/app_colors.dart';
import 'package:patient_app/src/generated/patient_localizations.dart';

class HomeView extends StatelessWidget {
  static String id = "HomeView";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.bars,
              size: 24, color: AppColors.naturalBlack),
        ),
        title: Image.asset(
          "assets/images/patient_logo.png",
          width: 32,
          height: 32,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text("سلامتك يا مختار!"),
        ],
      )),
    );
  }
}
