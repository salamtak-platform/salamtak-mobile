import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:patient_app/components/custom_label.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          SharedLocalizations.of(context)!.inputGenderLabel,
          style: TextStyle(
            fontFamily: "Baloo Bhaijaan 2",
            package: 'ui_kit',
            fontSize: 16,
            fontWeight: FontWeight(500),
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: Label(
                  title: SharedLocalizations.of(context)!.inputGenderMale,
                  icon: FontAwesomeIcons.person),
            ),
            Expanded(
              child: Label(
                  title: SharedLocalizations.of(context)!.inputGenderFemale,
                  icon: FontAwesomeIcons.personDress),
            ),
          ],
        ),
      ],
    );
  }
}
