import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/courses/courses_content.dart';
import 'package:name/custom/custom_text.dart';
import 'package:name/utilities/constants.dart';
import 'package:name/utilities/navigation.dart';

import '../custom/custom_icon.dart';
import '../custom/custom_size.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({super.key});

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  String selectedCategories = "All Courses";

  @override
  Widget build(BuildContext context) {
    List<String> showCaseKey = [];

    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;
    for (var i in coursesList.entries) {
      List<String> name = i.value.last;
      if (name.contains(selectedCategories)) {
        showCaseKey.add(i.key);
      }
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  navigationpop(context: context);
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: LargeText(
                    text: "Categories",
                    size: 19,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // navigationpush(
                    //     widget: const CartPage(), context: context);
                  },
                  icon: CustomIconData(
                    iconData: Icons.shopping_cart,
                    size: 27,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: height * 0.05,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: chipData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // print("Item_selected id ${chipData[index]}");
                        setState(() {
                          selectedCategories = chipData[index];
                          showCaseKey = [];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: selectedCategories == chipData[index]
                                ? Colors.purpleAccent.withOpacity(.5)
                                : Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            chipData[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: showCaseKey.length,
                itemBuilder: (BuildContext context, int index) {
                  if (showCaseKey.isNotEmpty) {
                    var title = coursesList[showCaseKey[index]]![1];
                    String authorName = coursesList['courses${index + 1}']![2];
                    String rating = coursesList['courses${index + 1}']![3];
                    String price = coursesList['courses${index + 1}']![4];
                    return GestureDetector(
                      onTap: () {
                        navigationpush(
                            widget: CoursesContent(), context: context);
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(1),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                      color: const Color.fromARGB(
                                              255, 155, 147, 147)
                                          .withOpacity(.9)),
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                      color: const Color.fromARGB(
                                              255, 255, 244, 244)
                                          .withOpacity(.9))
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.4,
                                  height: height,
                                  child:
                                      Image.asset('assets/images/course.jpg'),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 8),
                                      child: Text(
                                        title,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(children: [
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
                                        SizedBox(
                                          width: width * 0.07,
                                        ),
                                        Text(
                                          price,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: OutlinedButton(
                                              onPressed: () {
                                                callfunction(title);
                                              },
                                              child: const Text("Enroll")),
                                        ),
                                        SizedBox(
                                          width: width * 0.07,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> callfunction(courseName) async {
    final docRe = await FirebaseFirestore.instance
        .collection("students")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "enrolledCourses": [courseName + "asc"]
    });
  }
}
