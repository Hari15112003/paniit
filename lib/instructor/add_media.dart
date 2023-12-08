import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/firebase/instructor.dart';
import 'package:name/instructor/instructor_course_add.dart';
import 'package:name/utilities/navigation.dart';

import '../custom/custom_size.dart';

class AddMedia extends StatefulWidget {
  const AddMedia(
      {super.key,
      required this.lessonName,
      required this.courseName,
      required this.totalLessons,
      required this.chapterName,
      required this.chapterCount});
  final List<String> lessonName;
  final String courseName;
  final int totalLessons;
  final String chapterName;
  final int chapterCount;
  @override
  State<AddMedia> createState() => _AddMediaState();
}

class _AddMediaState extends State<AddMedia> {
  File? file;
  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.arrow_back),
              Text(widget.courseName),
            ],
          ),
          SizedBox(
            height: height * 0.90,
            child: ListView.builder(
                itemCount: widget.lessonName.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      FirestoreServiceInstructor().addLesson(
                          instructorId: FirebaseAuth.instance.currentUser!.uid,
                          courseName: widget.courseName,
                          chapterName: widget.chapterName,
                          lessonName: widget.lessonName[index],
                          lessonFile: file.toString());
                    },
                    child: textField(
                        text: widget.lessonName[index],
                        height: height,
                        width: width),
                  );
                }),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
            onPressed: () {
              navigationpush(
                  widget: InstructorCourseAddPage(
                      chapterCount: widget.chapterCount,
                      courseName: widget.courseName),
                  context: context);
            },
            child: const Text("Upload")),
      ),
    );
  }

  Widget textField(
      {required String text, required double height, required double width}) {
    return SizedBox(
      height: height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.amber,
                height: height * 0.06,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Add media"),
                    Icon(Icons.upload),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
