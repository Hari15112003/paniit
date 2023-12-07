import 'package:flutter/material.dart';

class CustomTextEditor extends StatelessWidget {
  const CustomTextEditor(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.paddingValue});
  final TextEditingController controller;
  final String labelText;
  final double paddingValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
