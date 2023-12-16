import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:name/courses/courses_list.dart';
import 'package:name/pages/home.dart';
import 'package:name/pages/pomodoro.dart';
import '../settings/account_screen.dart';
import '../utilities/navigation.dart';
import 'analytics.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  int selectedIndex = 0;
  List<GButton> button = [
    const GButton(
      icon: Icons.home,
      text: 'Home',
      iconActiveColor: Colors.white,
      textColor: Colors.white,
    ),
    const GButton(
      icon: Icons.alarm,
      text: 'Pomodoro',
      iconActiveColor: Colors.white,
      textColor: Colors.white,
    ),
    const GButton(
      icon: Icons.analytics,
      text: 'Analytics',
      iconActiveColor: Colors.white,
      textColor: Colors.white,
    ),
    const GButton(
      icon: Icons.settings,
      text: 'Settings',
      iconActiveColor: Colors.white,
      textColor: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              selectedIndex == 0
                  ? const HomePage()
                  : selectedIndex == 1
                      ? const PomodoroPage()
                      : selectedIndex == 2
                          ? const AnalyticsPage()
                          : const AccountScreen()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigationpush(context: context, widget: const CoursesList());
          },
          child: const Icon(Icons.search),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[100]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,

                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.black,
                // color: Colors.black,
                tabs: button,
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
