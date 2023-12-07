// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:name/utilities/snack_bar.dart';

//image picker
Future<File?> pickImage(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }

  return image;
}

pickVideo(BuildContext context) async {
  final picker = ImagePicker();
  XFile? videoFile;
  try {
    videoFile = await picker.pickVideo(
        source: ImageSource.gallery, maxDuration: Duration(minutes: 30));
    return videoFile!;
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }
}
