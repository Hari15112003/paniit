import 'package:flutter/material.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/custom/custom_text.dart';

class TopBar extends StatelessWidget {
  final String text;
  const TopBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconData(iconData: Icons.arrow_back, size: 18),
        MediumText(text: text),
      ],
    );
  }
}
