import 'package:flutter/material.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/custom/custom_text.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Pomadoro"),
        const Text("Pomadoro"),
        CustomIconData(
          iconData: Icons.abc,
          size: 60,
        ),
        LargeText(
          text: "Hello",
        ),
        SmallText(text: 'Hello'),
        MediumText(text: "Hello")
      ],
    );
  }
}
