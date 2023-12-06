import 'package:flutter/material.dart';

class CustomIconData extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final double size;

  const CustomIconData(
      {super.key,
      required this.iconData,
      required this.color,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
