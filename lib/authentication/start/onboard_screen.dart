import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:name/authentication/auth/signin.dart';
import 'package:name/authentication/wrapper/auth_wrapper.dart';
import 'package:name/pages/initial_page.dart';
import 'package:name/utilities/navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final page = LiquidController();

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        LiquidSwipe(
          // slideIconWidget: Icon(Icons.arrow_back_ios),
          enableLoop: false,
          // enableSideReveal: true,
          liquidController: page,
          onPageChangeCallback: onPageChangedCallback,
          pages: [
            Container(
              height: height,
              width: width,
              color: const Color.fromARGB(255, 245, 245, 245),
              child: Stack(
                children: [
                  Positioned(
                    top: height * 0.4,
                    left: width * 0.5,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(15 / 360),
                      child: Container(
                        height: 600,
                        width: 500,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 218, 224, 227),
                            shape: BoxShape.circle),
                        margin: EdgeInsets.only(top: height * 0.15),
                        // child: Image.asset(
                        //   'assets/logo.png',
                        // ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: height * 0.45,
                    right: width * 0.3,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(30 / 360),
                      child: Container(
                        height: 500,
                        width: 500,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 218, 224, 227),
                            borderRadius:
                                BorderRadius.all(Radius.circular(250))),

                        margin: EdgeInsets.only(top: height * 0.15),
                        // child: Image.asset(
                        //   'assets/logo.png',
                        // ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.2,
                    right: width * 0.24,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  top: height * 0.4, left: width * 0.28),
                              child: Text(
                                "WELCOME TO",
                                style: TextStyle(
                                    fontSize: height * 0.022,
                                    color: Colors.black26),
                              )),
                          Container(
                              margin:
                                  EdgeInsets.only(left: width * 0.27, top: 10),
                              child: Image.asset(
                                'assets/png/logo2.png',
                                height: height * 0.1,
                              )),
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              color: const Color.fromARGB(255, 252, 233, 255),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: height * 0.5,
                      // margin: EdgeInsets.only(top: height * 0.14),
                      child: Lottie.asset("assets/json/on1.json"),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: height * 0.07, bottom: height * 0.02),
                        child: Text(
                          "Earn as you Learn!",
                          style: TextStyle(
                              fontSize: height * 0.041,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.045),
                        child: Text(
                          "Earn your penny, as you progress in a course, you get the money you spent back.",
                          style: TextStyle(
                            fontSize: height * 0.022,
                            color: Colors.black38,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ]),
            ),
            Container(
              width: width,
              color: const Color.fromARGB(255, 230, 238, 243),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: height * 0.37,
                      margin: EdgeInsets.only(top: height * 0.14),
                      child: Lottie.asset("assets/json/on2.json"),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: height * 0.07, bottom: height * 0.02),
                        child: Text(
                          "Boost Productivity",
                          style: TextStyle(
                              fontSize: height * 0.041,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.045),
                        child: Text(
                          "Using the Pomodoro technique, boost your concentration and study smarter.",
                          style: TextStyle(
                            fontSize: height * 0.022,
                            color: Colors.black38,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ]),
            ),
            Container(
              width: width,
              color: const Color.fromARGB(255, 235, 255, 235),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: height * 0.36,
                      margin: EdgeInsets.only(top: height * 0.14),
                      child: Lottie.asset("assets/json/on4.json"),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: height * 0.07, bottom: height * 0.02),
                        child: Text(
                          "Simple yet Smart",
                          style: TextStyle(
                              fontSize: height * 0.041,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.045),
                        child: Text(
                          "Everything is made easy with the aesthetics and simple yet pleasing UI/UX",
                          style: TextStyle(
                            fontSize: height * 0.022,
                            color: Colors.black38,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ]),
            ),
          ],
        ),
        Positioned(
          // left: width * 0.4,
          bottom: height * 0.1,
          child: OutlinedButton(
            onPressed: () {
              int nextpage = page.currentPage + 1;
              if (nextpage == 4) {
                navigationpush(widget: const StartingPage(), context: context);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const SignInPage()));
              } else {
                page.animateToPage(page: nextpage);
              }
            },
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black12,
                side: const BorderSide(color: Colors.black),
                shape: const CircleBorder(),
                padding: EdgeInsets.all(height * 0.017)),
            child: Container(
              padding: EdgeInsets.all(height * 0.02),
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
            top: height * 0.07,
            right: width * 0.03,
            child: TextButton(
              onPressed: () {
                navigationpush(widget: const AuthWrapper(), context: context);
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.black54),
              ),
            )),
        // Positioned(...),
        Positioned(
            bottom: height * 0.04,
            child: AnimatedSmoothIndicator(
              activeIndex: page.currentPage,
              count: 4,
              effect: WormEffect(
                  activeDotColor: Colors.black, dotHeight: height * 0.01),
            ))
      ],
    ));
  }

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentpage = activePageIndex;
    });
  }
}
