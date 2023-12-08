import 'package:flutter/material.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/custom/custom_text.dart';
import 'package:name/utilities/navigation.dart';

class TopBar extends StatelessWidget {
  final String text;
  const TopBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: [
          IconButton(
            icon: CustomIconData(iconData: Icons.arrow_back_ios, size: 25),
            onPressed: () {
              navigationpop(context: context);
            },
          ),
          MediumText(text: text),
        ],
      ),
    );
  }
}
