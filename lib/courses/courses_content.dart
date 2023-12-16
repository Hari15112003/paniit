import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:name/courses/expansion_panel.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/custom/custom_text.dart';
import 'package:name/utilities/constants.dart';
import 'package:name/utilities/navigation.dart';
import 'package:name/video/video_play.dart';
import 'package:readmore/readmore.dart';

import '../utilities/topbar.dart';
// import 'expansion_panel.dart';

class CoursesContent extends StatefulWidget {
  const CoursesContent({
    super.key,
  });

  @override
  State<CoursesContent> createState() => _CoursesContentState();
}

class _CoursesContentState extends State<CoursesContent> {
  int index = 0;
  Map<String, Map<String, dynamic>> data = {};
  // List<Item> _data = [];
  String courseName = "Invest Money Wisely";

  int _expandedIndex = -1;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('instructors')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                // List<DocumentSnapshot> documents = snapshot.data!.docs;

                // List<String> courseNames = [];
                // List<int> amount = [];
                // List<int> hours = [];
                // List<String> image_file = [];
                // List<int> starRatings = [];
                // var documentsName = {};
                // List<int> chapterCount = [];
                // // var lessonCount = [];
                // var description = [];
                // var category = [];

                Map ss = {};
                // for (var document in documents) {
                //   var model = document['coursePublished'];
                //   documentsName.addAll(model);
                // }

                // for (var models in documentsName.keys) {
                //   courseNames.add(models);
                // }
                // for (int i = 0; i < documentsName.length; i++) {
                //   try {
                //     var model = documentsName[courseNames[i]];
                //     // print(model);
                //     if (courseNames[i] == widget.courseName) {
                //       hours.add(model['hours']);
                //       amount.add(model['amount']);
                //       image_file.add(model['file']);
                //       starRatings.add(model['starRatings']);
                //       chapterCount.add(model['chapterCount']);
                //       ss = model['chapters'];
                //       description.add(model['description']);
                //       category.add(model['category']);
                //     }
                //     // print(model['hours']);
                //   } catch (e) {
                //     print(e);
                //   }
                // }
                // print("sdfgsfd: $ss");
                //TODO : very important code
                // var chapterName = [];
                // for (var i in ss.keys) {
                //   chapterName.add(i);
                //   var lessonName = [];
                //   for (var j in ss[i].keys) {
                //     lessonName.add(j);
                //   }
                // }
                // if (_data.isEmpty) {
                //   _loadData(
                //       documents); // Call a method to load data only once when the widget is created
                // }
                // for (var i in ss.keys) {
                //   var chapterName = i;
                //   List<String> lessonName = [];
                //   for (var j in ss[i].keys) {
                //     lessonName.add(j);
                //   }
                //   _data.add(Item(
                //     chapterName: chapterName,
                //     lessonNames: lessonName,
                //   ));
                // }
                //  String imageUrl = coursesList['courses${index + 1}']![0];
                // String tagLine = coursesList['courses${index + 1}']![1];
                // String authorName = coursesList['courses${index + 1}']![2];
                // String rating = coursesList['courses${index + 1}']![3];
                // String price = coursesList['courses${index + 1}']![4];

                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopBar(text: ""),
                      Container(
                        height: 220,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/course.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      LargeText(text: "CSS GRID"),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomIconData(
                                iconData: Icons.person,
                                color: Colors.blue,
                                size: 24),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Harish",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.blue),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: CustomIconData(
                                iconData: Icons.favorite,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child:
                                listTitle(icon: Icons.book, text: "4 Lessons"),
                          ),
                          Expanded(
                            flex: 2,
                            child:
                                listTitle(icon: Icons.timer, text: "2 Hours"),
                          ),
                          Expanded(
                            flex: 1,
                            child: listTitle(icon: Icons.star, text: "4 "),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ReadMoreText(
                          "This course enables you to build high-performance, visually engaging, and user-friendly apps using Flutter and helps you master key concepts such as Flutter widgets, state management, asynchronous programming, and network integration, along with hands-on experience to build real-world applications.",
                          trimLines: 5,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                          lessStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      LargeText(
                        color: Colors.black,
                        size: 20,
                        text: "Course Contents",
                      ),
                      MediumText(text: "Responsive layout"),
                      VideoPlay(
                        url: "assets/video/video1.mp4",
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: index == 1
                                      ? Colors.amber.shade400
                                      : Colors.grey.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star_rate_rounded),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("10"),
                                  ],
                                ),
                              )
                            ]),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: MediumText(text: "Grid Areas")),
                      VideoPlay(
                        url: "assets/video/video2.mp4",
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: index == 2
                                      ? Colors.amber.shade400
                                      : Colors.grey.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star_rate_rounded),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("10"),
                                  ],
                                ),
                              )
                            ]),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          child: MediumText(text: "Justify and Align")),
                      VideoPlay(
                        url: "assets/video/video3.mp4",
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: index == 3
                                      ? Colors.amber.shade400
                                      : Colors.grey.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star_rate_rounded),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("10"),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ]);
              }),
        ),
      ),
    );
  }

  Widget listTitle({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
        ),
        Text(
          text,
        ),
      ],
    );
  }

  void _loadData(List<DocumentSnapshot> documents) {
    // Your existing data loading logic here...
    // This method is now only called once when data is received from the StreamBuilder

    Map ss = {}; // Assuming you extract ss from documents
    for (var document in documents) {
      var model = document['coursePublished'];

      // Check if model and model['chapters'] are not null before accessing their properties
      if (model != null && model['chapters'] != null) {
        ss.addAll(model['chapters']);
      }
    }

    for (var i in ss.keys) {
      var chapterName = i;
      List<String> lessonName = [];

      // Check if ss[i] is not null and is a Map
      if (ss[i] != null && ss[i] is Map) {
        for (var j in ss[i].keys) {
          // Check if ss[i][j] is not null before adding to lessonName
          if (ss[i][j] != null) {
            lessonName.add(j);
          }
        }
      }

      // _data.add(Item(
      //   chapterName: chapterName,
      //   lessonNames: lessonName,
      // ));
    }
  }
}



// class Item {
//   String chapterName;
//   List<String> lessonNames;
//   bool isExpanded;

//   Item({
//     required this.chapterName,
//     required this.lessonNames,
//     this.isExpanded = false,
//   });
// }
