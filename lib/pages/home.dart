import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name/components/home/special_courses.dart';
import 'package:name/custom/custom_text.dart';

import '../components/home/enrolled_courses.dart';
import '../components/home/header.dart';
import '../custom/custom_size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;

    var name = FirebaseFirestore.instance
        .collection('students')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => value.get('enrolledCourses'))
        .toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(),
        paddingContent(text: "Enrolled Courses"),
        const EnrolledCourses(),
        paddingContent(text: "Popular Courses"),
        const PopularCourses(),
      ],
    );
  }

  Widget paddingContent({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: LargeText(
        text: text,
        size: 20,
      ),
    );
  }
}
