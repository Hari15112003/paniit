import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceStudent {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new student to the Firestore 'students' collection
  Future<void> addStudent(
      {required String userId,
      required String name,
      required String email,
      required String upiId}) async {
    await _firestore.collection('students').doc(userId).set({
      'name': name,
      'email': email,
      'totalCourseCompleted': 0,
      'enrolledCourses': [],
      'moneyObtained': 0,
      'onHoldMoney': 0,
      'upiId': upiId,
      'isInstructor': false,
    });
  }

  // Add a new instructor to the Firestore 'instructors' collection
  Future<void> addInstructor(String userId, String name, String email) async {
    await _firestore.collection('instructors').doc(userId).set({
      'name': name,
      'email': email,
      'totalCourseCompleted': 0,
      'enrolledCourses': [],
      'moneyObtained': 0,
      'onHoldMoney': 0,
      'upiId': '',
      'isInstructor': true,
    });
  }

  // Example function to update the total courses completed for a student
  Future<void> updateTotalCoursesCompleted(
      String userId, int totalCompleted) async {
    await _firestore.collection('students').doc(userId).update({
      'totalCourseCompleted': totalCompleted,
    });
  }

  // Example function to enroll a student in a course
  Future<void> enrollStudentInCourse(String userId, String courseId) async {
    await _firestore.collection('students').doc(userId).update({
      'enrolledCourses': FieldValue.arrayUnion([courseId]),
    });
  }
}
