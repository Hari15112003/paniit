import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebase/instructor.dart';
import '../utilities/navigation.dart';
import 'instructor_course_add.dart';

class CreateCourse extends StatefulWidget {
  const CreateCourse({super.key});

  @override
  State<CreateCourse> createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirestoreServiceInstructor()
                .addInstructor(
              FirebaseAuth.instance.currentUser!.uid,
              FirebaseAuth.instance.currentUser!.displayName ?? "Harish",
            )
                .whenComplete(
              () {
                FirestoreServiceInstructor()
                    .addCourse(
                        courseName: "Science",
                        instructorId: FirebaseAuth.instance.currentUser!.uid,
                        description:
                            "Hello: tagSocket(171) with statsTag=0xffffffff, statsUid=-1D/EGL_emulation( 4250): app_time_stats: avg=1487.18ms min=5.76ms max=9639.96ms count=7D/EGL_emulation( 4250): app_time_stats: avg=57.42ms min=11.37ms max=242.77ms count=17D/EGL_emulation( 4250): app_time_stats: avg=60.96ms min=7.45ms max=328.84ms count=15 ",
                        amount: 2000,
                        chapterCount: 4,
                        hours: 10,
                        categories: ["All Courses", "App dev"],
                        image: File('path'))
                    .whenComplete(
                      () => navigationpush(
                        context: context,
                        widget: InstructorCourseAddPage(
                          courseName: "English",
                          chapterCount: 4,
                        ),
                      ),
                    );
              },
            );
          },
          child: const Text("dshj"),
        ),
      ),
    );
  }
}
