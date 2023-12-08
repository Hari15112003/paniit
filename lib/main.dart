import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:name/authentication/start/onboard_screen.dart';
import 'package:name/authentication/wrapper/auth_wrapper.dart';
import 'package:name/firebase_options.dart';
import 'package:name/pages/initial_page.dart';
// import 'package:name/screens/screens.dart';
// import 'package:name/widgets/timrservice.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language/lang.dart';
import 'theme/colors/theme_data.dart';
import 'theme/provider/darktheme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // intializing firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // locking potrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);

  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: AuthWrapper()),
  );
}

// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   DarkThemeProvider themeChangeProvider = DarkThemeProvider();
//   // TimerService _timeService = TimerService();
//   void getCurrentAppTheme() async {
//     themeChangeProvider.setDarkTheme =
//         await themeChangeProvider.darkThemePreferences.getTheme();
//   }

//   @override
//   void initState() {
//     getCurrentAppTheme();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<DarkThemeProvider>(
//             create: (_) => themeChangeProvider),
//         // ChangeNotifierProvider<TimerService>(create: (_) => _timeService),
//       ],
//       child: Consumer<DarkThemeProvider>(
//         builder: (context, themeProvider, child) {
//           return GetMaterialApp(
//             translations: LocalString(),
//             locale: const Locale('en', 'US'),
//             debugShowCheckedModeBanner: false,
//             theme: Styles.themeData(themeProvider.getDarkTheme, context),
//             home: const StartingPage(),
//           );
//         },
//       ),
//     );
//   }
//   //TODO: CLEAR ALL TODO LIST , Will pop scope add , theme shifting , font size matching , language add , analytics page , pomodopage
// }


//     MaterialApp(
//       home: SafeArea(
//           child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               selectedIndex == 0
//                   ? const HomePage()
//                   : selectedIndex == 1
//                       ? const PomodoroPage()
//                       : selectedIndex == 2
//                           ? const AnalyticsPage()
//                           : const AccountScreen()
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           child: const Icon(Icons.search),
//         ),
//         bottomNavigationBar: Container(
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//             color: Colors.white.withOpacity(0.8),
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 20,
//                 color: Colors.black.withOpacity(.1),
//               )
//             ],
//           ),
//           child: SafeArea(
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//               child: GNav(
//                 rippleColor: Colors.grey[300]!,
//                 hoverColor: Colors.grey[100]!,
//                 gap: 8,
//                 activeColor: Colors.black,
//                 iconSize: 24,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 duration: const Duration(milliseconds: 400),
//                 tabBackgroundColor: Colors.grey[100]!,
//                 color: Colors.black,
//                 tabs: button,
//                 selectedIndex: selectedIndex,
//                 onTabChange: (index) {
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//               ),
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
