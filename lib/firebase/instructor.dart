import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceInstructor {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addInstructor(
    String userId,
    String name,
  ) async {
    await _firestore.collection('instructors').doc(userId).set({
      'name': name,
      'amountGained': 0,
      'coursePublished': {},
      'courseCount': 0,
    });
  }

  // Example function to add a new course for an instructor
  Future<void> addCourse({
    required String instructorId,
    required String courseName,
    required String description,
    required int amount,
    required int chapterCount,
    required int hours,
    required List<String> categories,
    // Map<String, dynamic> chapters,
    required File? image,
  }) async {
    await _firestore.collection('instructors').doc(instructorId).update({
      'coursePublished.$courseName': {
        'amount': amount,
        'category': categories,
        'starRatings': 0,
        // 'chapters': chapters,
      },
    }).whenComplete(() async {
      var count = await _firestore
          .collection('instructors')
          .doc(instructorId)
          .get()
          .then((value) => value.get('courseCount'));
      await _firestore
          .collection('instructors')
          .doc(instructorId)
          .update({'courseCount': count + 1});
    });
  }

  // Example function to add a new chapter for a course
  Future<void> addChapter({
    required String instructorId,
    required String courseName,
    required String chapterName,
    // required int lessonCount,
    required String lessonName,
    required File? lessonFile,
  }) async {
    // await _firestore.collection('instructors').doc(instructorId).update({
    //   'coursePublished.$courseName.chapters.$chapterName': lessons,
    //   lessonCount: lessonCount
    // });
    await _firestore.collection('instructors').doc(instructorId).set({
      'coursePublished.$courseName.chapters.$chapterName.$lessonName': {
        'lessonNameFile': lessonFile,
        'lessonName': lessonName
      },
      // lessonCount: lessonCount
    });
  }

  // Example function to add a new lesson for a chapter
  Future<void> addLesson(
    String instructorId,
    String courseName,
    String chapterName,
    String lessonName,
    String lessonFile,
  ) async {
    await _firestore.collection('instructors').doc(instructorId).update({
      'coursePublished.$courseName.chapters.$chapterName.$lessonName': {
        'lessonNameFile': lessonFile,
        'lessonName': lessonName
      },
    });
  }
}
