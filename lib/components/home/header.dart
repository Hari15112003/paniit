// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:name/custom/custom_size.dart';
import 'package:name/custom/custom_text.dart';

class Header extends StatelessWidget {
  Header({super.key});

  String name = "Harish";
  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;
    return Container(
      height: height * 0.28,
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextData(
                        text: DateFormat.yMMMd().format(
                          DateTime.now(),
                        ),
                        size: 12,
                        color: Colors.black),
                    Text(
                      "Hey, $name !",
                      style: GoogleFonts.akayaKanadaka(fontSize: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HeaderBottom(
                description: "Active",
                count: 13,
              ),
              HeaderBottom(description: "Pending", count: 15),
              HeaderBottom(description: "Completed", count: 21),
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
  final int count;

  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;
    return AnimatedPadding(
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.all(20),
      curve: Curves.easeInOut,
      child: Container(
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
      ),
    );
  }
}
