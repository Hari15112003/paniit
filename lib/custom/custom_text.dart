import 'package:flutter/material.dart';

class CustomTextData extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const CustomTextData(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: size, color: color, fontWeight: FontWeight.normal));
  }
}
