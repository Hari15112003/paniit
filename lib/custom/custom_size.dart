import 'package:flutter/material.dart';

class CustomSizeData {
  final double height;
  final double width;
  final double aspectRatio;
  final double smallfont;
  final double largefont;

  final double mediumfont;

  // use data with this
  factory CustomSizeData.from(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    double smallfont = aspectRatio * 32;
    double largefont = aspectRatio * 40;
    double mediumfont = aspectRatio * 37;
    return CustomSizeData(
        mediumfont: mediumfont,
        smallfont: smallfont,
        largefont: largefont,
        height: height,
        width: width,
        aspectRatio: aspectRatio);
  }

  CustomSizeData(
      {required this.mediumfont,
      required this.smallfont,
      required this.largefont,
      required this.aspectRatio,
      required this.height,
      required this.width});

  //change data with this
  CustomSizeData copyWith(
      {double? largefont, double? smallfont, double? mediumfont}) {
    return CustomSizeData(
        smallfont: smallfont ?? this.smallfont,
        mediumfont: mediumfont ?? this.mediumfont,
        largefont: largefont ?? this.largefont,
        aspectRatio: aspectRatio,
        height: height,
        width: width);
  }
}
