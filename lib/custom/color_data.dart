import 'package:flutter/material.dart';

class CustomColorData {
  final Color Function(double) fontColor;
  final Color Function(double) primaryColor;

  final Color Function(double) sideBarTextColor;
  final Color sideBarIconColor;

  CustomColorData({
    required this.fontColor,
    required this.primaryColor,
    required this.sideBarTextColor,
    required this.sideBarIconColor,
  });

  factory CustomColorData.from(BuildContext context) {
    Color fontColor(double opacity) =>
        const Color(0XFF1C2136).withOpacity(opacity);
    Color primaryColor(double opacity) =>
        const Color(0XFF5D44F8).withOpacity(opacity);

    Color sideBarTextColor(double opacity) => Colors.white.withOpacity(opacity);
    const Color sideBarIconColor = Color(0XFFE8AD49);

    return CustomColorData(
      fontColor: fontColor,
      primaryColor: primaryColor,
      sideBarTextColor: sideBarTextColor,
      sideBarIconColor: sideBarIconColor,
    );
  }
}
