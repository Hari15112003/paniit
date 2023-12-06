import 'package:flutter/material.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomTextData(
              text: "Enrolled Courses", size: 20, color: Colors.black),
        ),
        const ActiveCourses(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomTextData(
              text: "Special Courses", size: 20, color: Colors.black),
        ),
        const SpecialCourses(),
      ],
    );
  }
}
