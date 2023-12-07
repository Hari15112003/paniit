// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomIconData extends StatelessWidget {
  final IconData iconData;
  Color? color;
  final double size;

  CustomIconData({
    this.color,
    super.key,
    required this.iconData,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color ?? Colors.black,
    );
  }
}
