import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/custom/custom_text.dart';
import 'package:name/utilities/constants.dart';
import 'package:name/utilities/navigation.dart';
import 'package:readmore/readmore.dart';

import '../utilities/topbar.dart';
import 'expansion_panel.dart';

class CoursesContent extends StatefulWidget {
  const CoursesContent({super.key, required this.courseName});
  final String courseName;

  @override
  State<CoursesContent> createState() => _CoursesContentState();
}

class _CoursesContentState extends State<CoursesContent> {
  // pattent_for_contents
// 'courses1': [
//    0. "image_url"
//    1. "tag_line"
//    2. "author name"
//    3. "ratings"
//    4. "amount",
//    5. "preview image or video"
//    6. "total lessons"
//    7.  "total_hours needed to cover the topic",
//    8. "Liked or disliked"
//    9. "description"
//    10. enrolled or not enrolled
//    11. cart or not in
//    12. atlast follow categories fall in
//   ],
  // late List<Item> _data;
  // int index = 28;
  // @override
  // void initState() {
  //   final List<Item> _data = generateItems(28);
  //   super.initState();
  // }

  final List<Item> _data = generateItems(28);
  @override
  Widget build(BuildContext context) {
    // String courseTitle = coursesList[widget.courseName]![1];
    // String lessonCount = coursesList[widget.courseName]![6];
    // String lessonHours = coursesList[widget.courseName]![7];
    // bool like = coursesList[widget.courseName]![8];
    // String courseDescription = coursesList[widget.courseName]![9];
    // String authorName = coursesList[widget.courseName]![2];
    // String ratings = coursesList[widget.courseName]![3];

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
                final documents = snapshot.data!.docs;

                List<String> courseName = [];
                List<int> amount = [];
                List<int> hours = [];
                List<String> image_file = [];
                List<int> starRatings = [];
                var documentsName = {};
                List<int> chapterCount = [];
                var lessonCount = [];
                var description = [];
                var category = [];

                for (var document in documents) {
                  var model = document['coursePublished'];
                  documentsName.addAll(model);
                }
                print(documentsName);
                // for (var models in documentsName.keys) {
                //   courseName.add(models);
                // }
                // // print(documentsName);
                // for (int i = 0; i < documentsName.length; i++) {
                //   try {
                //     var model = documentsName[courseName[i]];
                //     if (model == widget.courseName) {
                //       hours.add(model['hours']);
                //       amount.add(model['amount']);
                //       image_file.add(model['file']);
                //       starRatings.add(model['starRatings']);
                //       chapterCount.add(model['chapterCount']);
                //       Map ss = (model['chapters']);
                //       lessonCount.add(ss.length);
                //       description.add(model['description']);
                //       category.add(model['category']);
                //     }
                //     // print(model['hours']);
                //   } catch (e) {
                //     print(e);
                //   }
                // }
                print(hours);
                print(amount);
                print(image_file);
                print(starRatings);
                print(chapterCount);
                print(category);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopBar(text: ""),
                    const Placeholder(
                      fallbackHeight: 220,
                    ),
                    LargeText(text: widget.courseName),
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
                            'authorName'.toString(),
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
                                size: 24),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: listTitle(
                              icon: Icons.book,
                              text: "${lessonCount[0]} Lessons"),
                        ),
                        Expanded(
                          flex: 2,
                          child: listTitle(
                              icon: Icons.timer, text: "${hours[0]} Hours"),
                        ),
                        Expanded(
                          flex: 1,
                          child: listTitle(
                              icon: Icons.star, text: "${starRatings[0]} "),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ReadMoreText(
                        description[0].toString(),
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
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _data[index].isExpanded = isExpanded;
                        });
                      },
                      children: _data.map<ExpansionPanel>((Item item) {
                        return ExpansionPanel(
                          canTapOnHeader: true,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return const ListTile(
                              title: Text('item'),
                            );
                          },
                          body: const ExpansionPanelListExample(),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget listTitle({required IconData icon, required String text}) {
    return Row(
      children: [Icon(icon), Text(text)],
    );
  }
}
