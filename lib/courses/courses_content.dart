import 'package:flutter/material.dart';
import 'package:name/custom/custom_icon.dart';
import 'package:name/custom/custom_text.dart';
import 'package:name/utilities/constants.dart';
import 'package:readmore/readmore.dart';

import 'expansion_panel.dart';

class CoursesContent extends StatefulWidget {
  const CoursesContent({super.key, required this.courses});
  final String courses;

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
  final List<Item> _data = generateItems(8);
  @override
  Widget build(BuildContext context) {
    String courseTitle = coursesList[widget.courses]![1];
    String lessonCount = coursesList[widget.courses]![6];
    String lessonHours = coursesList[widget.courses]![7];
    bool like = coursesList[widget.courses]![8];
    String courseDescription = coursesList[widget.courses]![9];
    String authorName = coursesList[widget.courses]![2];
    String ratings = coursesList[widget.courses]![3];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Placeholder(
                fallbackHeight: 50,
              ),
              const Placeholder(
                fallbackHeight: 220,
              ),
              CustomTextData(
                text: courseTitle,
                size: 20,
                color: Colors.black,
              ),
              Row(
                children: [
                  const CustomIconData(
                      iconData: Icons.person, color: Colors.blue, size: 24),
                  CustomTextData(
                    text: authorName,
                    size: 20,
                    color: Colors.blue,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const CustomIconData(
                        iconData: Icons.favorite, color: Colors.blue, size: 24),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  listTitle(
                      icon: Icons.point_of_sale, text: "$lessonCount Lessons"),
                  listTitle(icon: Icons.timer, text: "$lessonHours Hours"),
                  listTitle(icon: Icons.star, text: "$ratings ")
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ReadMoreText(
                  courseDescription,
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
              const CustomTextData(
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
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                        title: Text("Title"),
                        subtitle: Text("Sub title"),
                      );
                    },
                    body: const ExpansionPanelListExample(),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
              )
            ],
          ),
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
