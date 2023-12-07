// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/utilities/image_pick.dart';
import 'package:provider/provider.dart';

import 'edit_item.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String gender = "male";
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> selectedImage() async {
    if (mounted) {
      image = await pickImage(context);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fixedSize: const Size(60, 50),
                  elevation: 3,
                ),
                icon: CustomIconData(iconData: Icons.abc, size: 16)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "account".tr,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              EditItem(
                title: "Photo",
                widget: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        selectedImage();
                      },
                      child: image == null
                          ? const CircleAvatar(
                              backgroundColor: Colors.purple,
                              radius: 40,
                              child: Icon(
                                Icons.account_circle,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(image!),
                              radius: 50,
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              EditItem(
                title: "plantname".tr,
                widget: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(height: 40),
              EditItem(
                title: "gender".tr,
                widget: Row(
                  children: [
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: gender == 'male'
                              ? const Color.fromARGB(161, 217, 177, 232)
                              : Colors.white),
                      label: Text('male'.tr),
                      onPressed: () {
                        setState(() {
                          gender = 'male';
                        });
                      },
                      icon: const Icon(Icons.male),
                    ),
                    const SizedBox(width: 20),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: gender == 'female'
                              ? const Color.fromARGB(161, 217, 177, 232)
                              : Colors.white),
                      label: Text('female'.tr),
                      onPressed: () {
                        setState(() {
                          gender = 'female';
                        });
                      },
                      icon: const Icon(Icons.male),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              EditItem(
                widget: TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                ),
                title: "age".tr,
              ),
              const SizedBox(height: 40),
              EditItem(
                widget: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                title: "email".tr,
              ),
              const SizedBox(height: 40),
              EditItem(
                widget: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                title: "phnumber".tr,
              ),
              const SizedBox(height: 40),
              EditItem(
                widget: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                title: "password".tr,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
