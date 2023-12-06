// ignore_for_file: unused_field, non_constant_identifier_names, unused_import, unused_local_variable

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/custom/custom_text.dart';
import 'package:name/screen/cart/cart_page.dart';
import 'package:name/screen/instructor/instructor_course_add.dart';
import 'package:name/settings/setting_item.dart';
import 'package:name/utilities/navigation.dart';
import 'package:provider/provider.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      navigationpush(
                          widget: const CartPage(), context: context);
                    },
                    icon: const CustomIconData(
                        iconData: Icons.shopping_cart,
                        color: Colors.black,
                        size: 27))
              ],
            ),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 60,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Row(
                children: [Icon(Icons.email), Text("harish.rr.9791@gmail.com")],
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  navigationpush(
                      widget: const InstructorCourseAddPage(),
                      context: context);
                },
                child: const CustomTextData(
                    text: "Switch to instructor view",
                    size: 20,
                    color: Colors.purple)),
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
              value: true,
              //  themeChange.getDarkTheme,
              onTap: (value) {
                // themeChange.setDarkTheme = value;
              },
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: "about".tr,
              icon: Icons.description,
              bgColor: Colors.red.shade100,
              iconColor: Colors.red,
              onTap: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
