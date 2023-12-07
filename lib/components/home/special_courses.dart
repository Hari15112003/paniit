import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../custom/custom_icon.dart';
import '../../custom/custom_size.dart';
import '../../utilities/constants.dart';
import '../../utilities/snack_bar.dart';

class SpecialCourses extends StatefulWidget {
  const SpecialCourses({super.key});

  @override
  State<SpecialCourses> createState() => _SpecialCoursesState();
}

class _SpecialCoursesState extends State<SpecialCourses> {
  List popularCourses = [];

  fetchData() async {
    var popular = await FirebaseFirestore.instance
        .collection('popularCourses')
        .doc('id')
        .get()
        .then((value) => value.get('courses'));
    popularCourses.addAll(popular);
  }

  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('instructors')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        // ;(FirebaseAuth.instance.currentUser!.uid).snapshots();
        builder: (BuildContext context, snapshot) {
          try {
            Map<String, dynamic> published_courses =
                snapshot.data!.get('coursePublished');
          } catch (e) {
            showSnackBar(context: context, content: e.toString());
          }

          return SizedBox(
            height: height * 0.33,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coursesList.length,
              itemBuilder: (BuildContext context, int index) {
                String imageUrl = coursesList['courses${index + 1}']![0];
                String tagLine = coursesList['courses${index + 1}']![1];
                String authorName = coursesList['courses${index + 1}']![2];
                String rating = coursesList['courses${index + 1}']![3];
                String price = coursesList['courses${index + 1}']![4];

                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(1),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: const Color.fromARGB(255, 155, 147, 147)
                                    .withOpacity(.9)),
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 1,
                                color: const Color.fromARGB(255, 255, 244, 244)
                                    .withOpacity(.9))
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      width: width * 0.58,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Placeholder(
                            fallbackHeight: 130,
                          ),
                          Text(
                            "  $tagLine",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomIconData(
                                    iconData: Icons.person,
                                    color: Colors.blue,
                                    size: 18),
                                Text(
                                  authorName,
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
                                      size: 27),
                                  Text(
                                    rating,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                price,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
          );
        },
      ),
    );
  }
}
