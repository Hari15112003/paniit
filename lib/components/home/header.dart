// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:name/custom/custom_size.dart';
import 'package:name/custom/custom_text.dart';

class Header extends StatefulWidget {
  Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String name = "Welcome";
  String active = '0';
  String pending = '0';
  String completed = '0';
  String rupee = "\u{20B9}";
  void initState() {
    final docRef = FirebaseFirestore.instance
        .collection("students")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    docRef.get().then(
      (DocumentSnapshot<Map<String, dynamic>> doc) {
        if (doc.exists) {
          setState(() {
            name = doc.get('name').toString();
            active = doc.get('moneyObtained').toString();
            pending = doc.get('onHoldMoney').toString();
            completed = doc.get('enrolledCourses').length.toString();
          });
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;
    return Container(
      height: height * 0.27,
      decoration: BoxDecoration(
          color: Colors.blue.shade100.withOpacity(0.4),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                child: Image.asset(
                  'assets/png/logo1.png',
                  height: height * 0.15,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: DateFormat.yMMMd().format(
                        DateTime.now(),
                      ),
                    ),
                    Text(
                      "Hey, $name !",
                      style: GoogleFonts.akayaKanadaka(fontSize: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.15,
                    // child: Image.network(
                    //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9IfNO7TxCkHFE76-Yg6ZqfT58WUKLzjezGg&usqp=CAU"),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HeaderBottom(
                description: "Earned ",
                count: ' $rupee $active',
              ),
              HeaderBottom(description: "Pending ", count: '$rupee $pending'),
              HeaderBottom(description: "Enrolled", count: completed),
            ],
          )
        ],
      ),
    );
  }
}

class HeaderBottom extends StatelessWidget {
  const HeaderBottom(
      {super.key, required this.description, required this.count});
  final String description;
  final String? count;

  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;
    return Container(
      height: height * 0.10,
      width: width * 0.185,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 83, 30, 229).withOpacity(.9),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 28),
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.white24.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
