// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final String text;
  double? size;
  Color? color;
  MediumText({this.size, super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? MediaQuery.of(context).size.aspectRatio * 46,
          color: color ?? Colors.black,
          fontWeight: FontWeight.normal),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  double? size;
  Color? color;
  SmallText({super.key, required this.text, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? MediaQuery.of(context).size.aspectRatio * 40,
        color: color ?? Colors.black,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

// large text always bold so change size
class LargeText extends StatelessWidget {
  final String text;
  double? size;
  Color? color;
  LargeText({super.key, required this.text, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? MediaQuery.of(context).size.aspectRatio * 55,
        color: color ?? Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
