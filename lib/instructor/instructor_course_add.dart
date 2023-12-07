import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/custom/custom_text.dart';
import 'package:name/instructor/chapter_screen.dart';
import 'package:name/utilities/navigation.dart';
import 'package:name/utilities/snack_bar.dart';

import '../custom/custom_size.dart';
import '../utilities/textfield.dart';

class InstructorCourseAddPage extends StatefulWidget {
  final int chapterCount;
  final String courseName;
  const InstructorCourseAddPage({
    super.key,
    required this.chapterCount,
    required this.courseName,
  });

  @override
  State<InstructorCourseAddPage> createState() =>
      _InstructorCourseAddPageState();
}

class _InstructorCourseAddPageState extends State<InstructorCourseAddPage> {
  //TODO
  // get the chapterCount some where else
  // String name of the course you are creating
  int chapterCount = 10;
  String courseName = "Science";

  builddialog(BuildContext context, String course) {
    showDialog(
        context: context,
        builder: (builder) {
          TextEditingController title = TextEditingController();

          TextEditingController totalChapter = TextEditingController();
          return AlertDialog(
            title: Text(course),
            content: Container(
              height: CustomSizeData.from(context).height * 0.3,
              width: double.maxFinite,
              child: Column(
                children: [
                  Text("Chapter title:"),
                  CustomTextEditor(
                    controller: title,
                    paddingValue: 20,
                    labelText: "title",
                  ),
                  Text("Total No.of.lessons"),
                  CustomTextEditor(
                    controller: totalChapter,
                    paddingValue: 20,
                    labelText: "title",
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (title.text.isNotEmpty && totalChapter.text.isNotEmpty)
                      navigationpush(
                          widget: ChapterScreen(
                            chapterCount: widget.chapterCount,
                              courseName: widget.courseName,
                              chapterName: title.text.trim(),
                              totalLessons:
                                  int.parse(totalChapter.text.toString())),
                          context: context);
                  },
                  child: Text("Proceed")),
              TextButton(
                  onPressed: () {
                    navigationpop(context: context);
                  },
                  child: Text("Cancel")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<String> chapter =
        List.generate(chapterCount, (index) => "Chapter$index");

    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // TODO: streambuilder-reference
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
                  print(published_courses[widget.courseName]);

                  //                  ..get().then(
                  //     (DocumentSnapshot<Map<String, dynamic>> doc) {
                  //       if (doc.exists) {
                  //         // final data = doc.data();
                  //         final bool = doc.get('isInstructor');
                  //         setState(() {
                  //           isInstructorMode = bool;
                  //         });
                  //         print(bool);
                  //         // print(data);
                  //       } else {
                  //         print("Document does not exist");
                  //       }
                  //     },
                  //     // ignore: avoid_print
                  //   ).catchError((e) => print("Error getting document: $e"));
                  // }//
                } catch (e) {
                  showSnackBar(context: context, content: e.toString());
                }
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          navigationpop(context: context);
                        },
                      ),
                    ),
                    Placeholder(
                      fallbackHeight: 260,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: width,
                      height: height * 0.6,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 157, 155, 155)
                            .withOpacity(.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     testField(
                          //         text: "Title",
                          //         width: width * 0.08,
                          //         controller: title),
                          //     testField(
                          //         text: "Chapter Count",
                          //         width: width * 0.08,
                          //         controller: totalChapter),
                          //   ],
                          // ),
                          LargeText(
                            text: courseName,
                          ),
                          SizedBox(
                            height: height * 0.40,
                            child: ListView.builder(
                                itemCount: widget.chapterCount,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    onTap: () {
                                      builddialog(
                                          context, "Chapter ${index + 1}");
                                    },
                                    title: Text(
                                      "Chapter ${index + 1}".toString(),
                                    ),
                                    trailing: const Icon(Icons.add),
                                  );
                                }),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Edit Course"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget testField(
      {required String text,
      required double width,
      required TextEditingController controller}) {
    return Row(
      children: [
        Text(text),
        const SizedBox(
          height: 20,
          width: 20,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            controller: controller,
          ),
        )
      ],
    );
  }
}
