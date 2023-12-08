import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceInstructor {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addInstructor({
    required String userId,
    required String name,
  }) async {
    await _firestore.collection('instructors').doc(userId).set({
      'name': name,
      'amountGained': 0,
      'courseCount': 0,
      'coursePublished': {}
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
    required String image,
  }) async {
    await _firestore.collection('instructors').doc(instructorId).update({
      'coursePublished.$courseName': {
        'amount': amount,
        'category': categories,
        'starRatings': 0,
        'description': description,
        'chapterCount': chapterCount,
        'hours': hours,
        'file': image,
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
  }) async {
    await _firestore.collection('instructors').doc(instructorId).update({
      'coursePublished.$courseName.chapters.$chapterName': {},
    });
    // await _firestore.collection('instructors').doc(instructorId).update({
    //   'coursePublished.$courseName.chapters.$chapterName.$lessonName': {
    //     'lessonNameFile': lessonFile,
    //     'lessonName': lessonName
    //   },
    // lessonCount: lessonCount
  }

  // Example function to add a new lesson for a chapter
  Future<void> addLesson({
    required String instructorId,
    required String courseName,
    required String chapterName,
    required String lessonName,
    required String lessonFile,
  }) async {
    await _firestore.collection('instructors').doc(instructorId).update({
      'coursePublished.$courseName.chapters.$chapterName.$lessonName': {
        'lessonNameFile': lessonFile,
        'lessonName': lessonName
      },
    });
  }
}
