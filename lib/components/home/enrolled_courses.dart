import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/components/home/special_courses.dart';
import 'package:name/courses/courses_content.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/utilities/navigation.dart';

import '../../custom/custom_size.dart';
import '../../utilities/constants.dart';

class EnrolledCourses extends StatefulWidget {
  const EnrolledCourses({super.key});

  @override
  State<EnrolledCourses> createState() => _EnrolledCoursesState();
}

class _EnrolledCoursesState extends State<EnrolledCourses> {
  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('students')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final documents = snapshot.data!.data();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: height * 0.33,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coursesList.length,
                itemBuilder: (BuildContext context, int index) {
                  // String imageUrl = image_file[index];
                  // String tagLine = courseName[index];
                  // String author = authorName[index];
                  // int rating = starRatings[index];
                  // int price = amount[index];

                  String imageUrl = coursesList['courses${index + 1}']![0];
                  String tagLine = coursesList['courses${index + 1}']![1];
                  String authorName = coursesList['courses${index + 1}']![2];
                  String rating = coursesList['courses${index + 1}']![3];
                  String price = coursesList['courses${index + 1}']![4];
                  return GestureDetector(
                    onTap: () {
                      navigationpush(
                        widget:
                            CoursesContent(),
                        context: context,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(1),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  color:
                                      const Color.fromARGB(255, 155, 147, 147)
                                          .withOpacity(.9)),
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  color:
                                      const Color.fromARGB(255, 255, 244, 244)
                                          .withOpacity(.9))
                            ],
                            borderRadius: BorderRadius.circular(20)),
                        width: width * 0.58,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              child: Image.asset('assets/images/abc.jpg'),
                            ),
                            Text(
                              "  $tagLine",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomIconData(
                                    iconData: Icons.person,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  Text(
                                    "Harish",
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  )
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    CustomIconData(
                                      iconData: Icons.star,
                                      color: Colors.yellow,
                                      size: 27,
                                    ),
                                    Text(
                                      rating.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Amount: " + price.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
