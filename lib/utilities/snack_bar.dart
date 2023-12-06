import 'package:flutter/material.dart';

Future<void> showSnackBar(
    {required BuildContext context, required String content}) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}