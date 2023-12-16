import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:name/firebase/instructor.dart';
import 'package:name/instructor/instructor_course_add.dart';

import '../utilities/image_pick.dart';
import '../utilities/navigation.dart';

class CourseUpload extends StatefulWidget {
  const CourseUpload({super.key});

  @override
  State<CourseUpload> createState() => _CourseUploadState();
}

class _CourseUploadState extends State<CourseUpload> {
  File? image;
  Future<void> selectedImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    TextEditingController courseName = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController cost = TextEditingController();
    TextEditingController duration = TextEditingController();
    TextEditingController nochapter = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: hei * 0.12,
            ),
            Text(
              'Course Details',
              style: TextStyle(
                  fontSize: hei * 0.03,
                  color: Color.fromARGB(255, 76, 157, 175),
                  fontWeight: FontWeight.bold),
            ),
            Text('Fill the necessary details of your Course'),
            Container(
              // height: hei * 0.1,

              margin: EdgeInsets.only(
                  top: hei * 0.05, left: wid * 0.06, right: wid * 0.06),
              child: TextField(
                // maxLines: 2,
                controller: courseName,
                cursorColor: Color.fromARGB(255, 76, 157, 175),
                decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 76, 157, 175),
                    prefixIcon: Icon(Icons.title),
                    // hintStyle:,

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 157, 175))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // suffixIcon: Icon(Icons.na),
                    hintText: 'Enter Course name',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    helperText: 'example: Mathematics 101',
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'Course Name'),
              ),
            ),
            Container(
              // height: hei * 0.1,
              margin: EdgeInsets.only(
                  top: hei * 0.04, left: wid * 0.06, right: wid * 0.06),
              child: TextField(
                // maxLength: 3,
                controller: description,
                maxLines: 3,
                cursorColor: Color.fromARGB(255, 76, 157, 175),
                decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 76, 157, 175),
                    // hintStyle:,
                    prefixIcon: Icon(Icons.description),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 157, 175))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // suffixIcon: Icon(Icons.na),
                    hintText: 'Enter Course Description',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    helperText: 'example: abc...',
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'Course Description'),
              ),
            ),
            Container(
              height: hei * 0.1,
              margin: EdgeInsets.only(
                  top: hei * 0.04, left: wid * 0.06, right: wid * 0.06),
              child: TextField(
                controller: cost,
                cursorColor: Color.fromARGB(255, 76, 157, 175),
                decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 76, 157, 175),
                    prefixIcon: Icon(Icons.currency_rupee),
                    // hintStyle:,

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 157, 175))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // suffixIcon: Icon(Icons.na),
                    hintText: 'Enter Cost of course in Rs',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    helperText: 'example: 300',
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'Cost of Course'),
              ),
            ),
            Container(
              height: hei * 0.1,
              margin: EdgeInsets.only(
                  top: hei * 0.04, left: wid * 0.06, right: wid * 0.06),
              child: TextField(
                controller: duration,
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(255, 76, 157, 175),
                decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 76, 157, 175),
                    prefixIcon: Icon(Icons.timelapse),
                    // hintStyle:,

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 157, 175))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // suffixIcon: Icon(Icons.na),
                    hintText: 'Enter Duration of course',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    helperText: 'example: 24 hrs',
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'Duration of Course'),
              ),
            ),
            Container(
              height: hei * 0.1,
              margin: EdgeInsets.only(
                  top: hei * 0.04, left: wid * 0.06, right: wid * 0.06),
              child: TextField(
                controller: nochapter,
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(255, 76, 157, 175),
                decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 76, 157, 175),
                    prefixIcon: Icon(Icons.numbers_outlined),
                    // hintStyle:,

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 157, 175))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // suffixIcon: Icon(Icons.na),
                    hintText: 'Enter number of chapters',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    helperText: 'example: 21',
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'Number of Chapters'),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await selectedImage();
                await storeFileToStorage(
                        "course/${FirebaseAuth.instance.currentUser!.uid}",
                        image!)
                    .then((values) => FirestoreServiceInstructor().addCourse(
                        instructorId: FirebaseAuth.instance.currentUser!.uid,
                        courseName: courseName.text.trim(),
                        description: description.text.trim(),
                        amount: int.fromEnvironment(cost.text),
                        chapterCount: int.fromEnvironment(nochapter.text),
                        hours: int.fromEnvironment(duration.text),
                        categories: ["All"],
                        image: values))
                    .whenComplete(
                      () => navigationpush(
                        context: context,
                        widget: InstructorCourseAddPage(
                          chapterCount: 5,
                          courseName: courseName.text.trim(),
                        ),
                      ),
                    );
              },
              child: Container(
                height: hei * 0.062,
                //   padding: EdgeInsets.sy
                // hmmetric(
                //       horizontal: wid * 0.29, vertical: hei * 0.015),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(
                    top: hei * 0.03,
                    bottom: hei * 0.05,
                    left: wid * 0.06,
                    right: wid * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.attach_file_outlined),
                    Text('Upload Thumbnail'),
                  ],
                ),
              ),
            ),
            Container(
              // margin: Ed,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 76, 157, 175),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.only(
                  left: wid * 0.06, right: wid * 0.06, bottom: hei * 0.03),
              // color: Colors.blue,
              height: hei * 0.07,
              child: Center(
                  child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: hei * 0.025),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
