// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:name/utilities/utils.dart';
// import 'package:name/widgets/chess.dart';
// import 'package:name/widgets/playit.dart';
// import 'package:name/widgets/progress.dart';
// import 'package:name/widgets/timecontroller.dart';
// import 'package:name/widgets/timeoptions.dart';
// import 'package:name/widgets/timercard.dart';
// import 'package:name/widgets/timrservice.dart';
// import 'package:name/widgets/xogame.dart';
// import 'package:provider/provider.dart';

// import '../theme/provider/darktheme_provider.dart';

// class PromodoroScreen extends StatefulWidget {
//   const PromodoroScreen({super.key});

//   @override
//   State<PromodoroScreen> createState() => _PromodoroScreenState();
// }

// class _PromodoroScreenState extends State<PromodoroScreen> {
//   bool isVisible = true;

//   Widget build(BuildContext context) {
//     final provider = Provider.of<TimerService>(context);

//     return Consumer<DarkThemeProvider>(
//         builder: (context, themeProvider, child) {
//       return Container(
//           color: renderColor(provider.currentstate),
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     height: 70,
//                     child: Image.asset("assets/images/learnpomo.png"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 30),
//                     child: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           isVisible = !isVisible;
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.info,
//                         color: Color.fromARGB(255, 121, 121, 121),
//                         size: 30,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 3,
//               ),
//               Visibility(
//                 visible: isVisible,
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Container(
//                     height: 180,
//                     width: 380,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage(
//                           "assets/images/about.png",
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const TimerCard(),
//               const SizedBox(
//                 height: 35,
//               ),
//               const TimeOptions(),
//               const SizedBox(
//                 height: 40,
//               ),
//               const TimeController(),
//               const SizedBox(
//                 height: 30,
//               ),
//               const ProgressWidget(),
//               const SizedBox(
//                 height: 30,
//               ),
//               const PlayPauseButton(),
//               const SizedBox(
//                 height: 7,
//               ),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         // Navigator.pop(context);
//                         Navigator.of(context).push(
//                             MaterialPageRoute(builder: (context) => XOgame()));
//                       },
//                       icon: Container(
//                         width: 180,
//                         height: 120,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             fit: BoxFit.fill,
//                             image: AssetImage("assets/images/game.png"),
//                           ),
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         // Navigator.pop(context);
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const PlayChess()));
//                       },
//                       icon: Container(
//                         width: 180,
//                         height: 120,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             fit: BoxFit.fill,
//                             image: AssetImage("assets/images/gamechess.png"),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ));
//     });
//   }
// }
