import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:lottie/lottie.dart";

import "../utilities/topbar.dart";

class GettingStarted extends StatefulWidget {
  const GettingStarted({super.key});

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
           
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Become an Instructor",
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(),
                ],
              ),
            ),
            Container(
              height: 400,
              width: 380,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Lottie.asset(
                        "assets/json/animation2.json",
                        height: 270,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Make an interesting course",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "You can create an engaging course whether you've been teaching for years or are just starting out. We've assembled tools and best practices to help you advance, no matter where you're beginning from.",
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 400,
              width: 380,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Lottie.asset("assets/json/animation1.json",
                          height: 270, repeat: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Teaching Reimagined",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Effortlessly create and manage courses, assign tasks, and interact with students. Elevate your teaching experience with our app.",
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 150,
              width: 380,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Start your course right away",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Container(
                    height: 50,
                    width: 200,
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Create your Course",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
