// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
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
  String active = '20';
  String pending = '30';
  String completed = '10';
  String rupee = "\u{20B9}";
  String image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9IfNO7TxCkHFE76-Yg6ZqfT58WUKLzjezGg&usqp=CAU";
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;
    return Column(
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
                    size: 15,
                  ),
                  Container(
                    width: 150,
                    child: Text(
                      "$name ",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.akayaKanadaka(fontSize: 25),
                    ),
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
                  child: Image.network(image, fit: BoxFit.fill),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
        // Placeholder(
        //   fallbackHeight: 230,
        // ),
        SizedBox(
          height: 220,
          child: ListView(
            children: [
              CarouselSlider(
                items: [
                  //1st Image of Slider
                  containerExample('assets/gif/live1.gif'),

                  //   //2nd Image of Slider
                  containerExample('assets/gif/live2.gif'),
                  //   //3rd Image of Slider
                  //   containerExample(file),

                  //   //4th Image of Slider
                  //   containerExample(file),
                  //   //5th Image of Slider
                  //  containerExample(file),
                ],

                //Slider Container properties
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ],
          ),
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
    );
  }

  Widget containerExample(String file) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Image.asset(
        file,
        fit: BoxFit.cover,
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
