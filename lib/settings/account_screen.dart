// ignore_for_file: unused_field, non_constant_identifier_names, unused_import, unused_local_variable

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name/arun/about.dart';
import 'package:name/authentication/auth/signin.dart';
import 'package:name/components/home/special_courses.dart';
import 'package:name/courses/course_upload.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/custom/custom_text.dart';
import 'package:name/instructor/create_course.dart';
import 'package:name/instructor/instructor_course_add.dart';
import 'package:name/settings/setting_item.dart';
import 'package:name/shiva/get_started.dart';
import 'package:name/theme/utils/dark_theme_preference.dart';
import 'package:name/utilities/navigation.dart';
import 'package:name/utilities/snack_bar.dart';
import 'package:provider/provider.dart';

import '../theme/provider/darktheme_provider.dart';
import '../utilities/button.dart';
import 'edit_screen.dart';
import 'setting_switch.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'MARATHI', 'locale': const Locale('mr', 'IN')},
  ];

  updatelanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  String email = "";
  String image = "";
  String earned = "";
  bool isInstructor = false;

  @override
  void initState() {
    final docRef = FirebaseFirestore.instance
        .collection("students")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    docRef.get().then(
      (DocumentSnapshot<Map<String, dynamic>> doc) {
        if (doc.exists) {
          setState(() {
            email = doc.get('email').toString();
            image = doc.get('profile').toString();
            earned = doc.get('moneyObtained').toString();
            isInstructor = doc.get('isInstructor');
          });
        }
      },
    );
    super.initState();
  }

  builddialog(BuildContext context, languageChange) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text("chooselang".tr),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        languageChange.setDarkTheme =
                            languageChange.getDarkTheme == "ma" ? "en" : "ma";
                      });
                      updatelanguage(locale[index]['locale']);
                    },
                    child: Text(
                      locale[index]['name'],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "settings".tr,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      // navigationpush(
                      //     widget: const CartPage(), context: context);
                    },
                    icon:
                        CustomIconData(iconData: Icons.shopping_cart, size: 27))
              ],
            ),
            const SizedBox(height: 25),
            CircleAvatar(radius: 60, backgroundImage: NetworkImage(image)),
            Row(
              children: [
                SizedBox(
                  width: 70,
                ),
                Icon(Icons.email),
                Text(email),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LargeText(text: "Earned"),
                LargeText(text: earned.toString())
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("With Draw"),
            ),
            TextButton(
                onPressed: () {
                  // TODO: check this operator
                  // if (isInstructor == false) {
                  //   navigationpush(
                  //       widget: const GettingStarted(), context: context);
                  // } else {
                  navigationpush(
                      widget: const CourseUpload(), context: context);
                  // }
                },
                child: LargeText(
                  text: isInstructor
                      ? "Switch to instructor"
                      : "Became an Instructor",
                  size: 20,
                  color: Colors.purpleAccent,
                )),
            SettingItem(
              title: "language".tr,
              icon: Icons.public,
              bgColor: Colors.orange.shade100,
              iconColor: Colors.orange,
              // value:
              // languageChange.getDarkTheme == "en"
              //     ? "English"
              //     : "Marathi",
              onTap: () {
                // builddialog(context, languageChange);
              },
            ),
            const SizedBox(height: 20),
            SettingSwitch(
              title: "theme".tr,
              icon: Icons.dark_mode,
              bgColor: Colors.purple.shade100,
              iconColor: Colors.purple,
              value: themeChange.getDarkTheme,
              onTap: (value) {
                themeChange.setDarkTheme = value;
              },
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: "about".tr,
              icon: Icons.description,
              bgColor: Colors.red.shade100,
              iconColor: Colors.red,
              onTap: () {
                navigationpush(widget: const AboutPage(), context: context);
              },
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () async {
                _signOut();
              },
              child: const Text("Sign out"),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> changeInstructor() async {
  //   final docRe = FirebaseFirestore.instance
  //       .collection("students")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .update({"isInstructor": true});
  //   final docRef = FirebaseFirestore.instance
  //       .collection("students")
  //       .doc(FirebaseAuth.instance.currentUser!.uid);
  //   await docRef.get().then(
  //     (DocumentSnapshot<Map<String, dynamic>> doc) {
  //       if (doc.exists) {
  //         // final data = doc.data();
  //         final bool = doc.get('isInstructor');
  //         setState(() {
  //           isInstructorMode = bool;
  //         });
  //       } else {}
  //     },
  //   );
  // }

  // Future<bool?> isInstructor() async {
  //   bool? instructor;
  //   final docRef = FirebaseFirestore.instance
  //       .collection("students")
  //       .doc(FirebaseAuth.instance.currentUser!.uid);
  //   await docRef.get().then((DocumentSnapshot<Map<String, dynamic>> doc) {
  //     if (doc.exists) {
  //       instructor = doc.get('isInstructor');
  //     }
  //   });
  //   return instructor;
  // }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then(
          (value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SignInPage()),
              (route) => false),
        );
  }
}
