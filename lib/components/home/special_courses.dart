import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name/courses/courses_content.dart';
import 'package:name/pages/initial_page.dart';
import 'package:name/utilities/navigation.dart';

import '../../custom/custom_icon.dart';
import '../../custom/custom_size.dart';
import '../../utilities/constants.dart';
import '../../utilities/snack_bar.dart';

var list_long = {};

class PopularCourses extends StatefulWidget {
  const PopularCourses({super.key});

  @override
  State<PopularCourses> createState() => _PopularCoursesState();
}

class _PopularCoursesState extends State<PopularCourses> {
  List popularCourses = [];

  fetchData() async {
    var popular = await FirebaseFirestore.instance
        .collection('popularCourses')
        .doc('id')
        .get()
        .then((value) => value.get('courses'));
    popularCourses.addAll(popular);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('instructors').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          // Iterate through documents
          // final documents = snapshot.data!.docs;

          // List<String> courseName = [];
          // List<int> amount = [];
          // List<int> hours = [];
          // List<String> image_file = [];
          // List<int> starRatings = [];
          // List<String> authorName = [];
          // var documentsName = {};

          // for (var document in documents) {
          //   var model = document['coursePublished'];
          //   documentsName.addAll(model);
          //   list_long.addAll(documentsName);
          // }
          // // print(documentsName);
          // for (var models in documentsName.keys) {
          //   courseName.add(models);
          // }
          // for (int i = 0; i < documentsName.length; i++) {
          //   try {
          //     var model = documentsName[courseName[i]];
          //     hours.add(model['hours']);
          //     amount.add(model['amount']);
          //     image_file.add(model['file']);
          //     starRatings.add(model['starRatings']);
          //     authorName.add(model['authorName']);
          //   } catch (e) {
          //     print(e);
          //   }
          // }
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
                // String imageUrl = image_file[index];
                // String tagLine = courseName[index];
                // String author = authorName[index];
                // int rating = starRatings[index];
                // int price = amount[index];

                return GestureDetector(
                  onTap: () {
                    navigationpush(
                        widget: CoursesContent(),
                        context: context);
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
                          Container(
                            height: 150,
                            child: Image.asset(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "  $tagLine",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomIconData(
                                      iconData: Icons.person,
                                      color: Colors.blue,
                                      size: 20),
                                  Text(
                                    // TODO : add author
                                    'author',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                                ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomIconData(
                                      iconData: Icons.star,
                                      color: Colors.yellow,
                                      size: 27),
                                  Text(
                                    rating.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "Amount: " + price.toString(),
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
