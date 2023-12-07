import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:name/firebase_options.dart';
import 'package:name/pages/analytics.dart';
import 'package:name/pages/home.dart';
import 'package:name/pages/pomodoro.dart';
import 'package:name/settings/account_screen.dart';
import 'package:name/video/video_play.dart';

import 'authentication/start/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // intializing firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // locking potrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedIndex = 0;
  List<GButton> button = [
    const GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    const GButton(
      icon: Icons.alarm,
      text: 'Pomodoro',
    ),
    const GButton(
      icon: Icons.analytics,
      text: 'Analytics',
    ),
    const GButton(
      icon: Icons.settings,
      text: 'Settings',
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
        onPressed: () {},
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
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
    ));
  }
}
