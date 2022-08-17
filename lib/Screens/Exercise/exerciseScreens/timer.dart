// import 'package:atfit_/Exercise/exerciseScreens/exerciseExecution.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class Timer extends StatefulWidget {
//   @override
//   _TimerState createState() => _TimerState();
// }

// class _TimerState extends State<Timer> {
//   void initState() {
//     //set time to load the new page
//     Future.delayed(Duration(seconds: 10), () {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) => ExerciseExecution()));
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     this.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//                 height: 100,
//                 child: Lottie.asset('assets/timer.json', repeat: false)),
//             SizedBox(height: 20),
//             Text(
//               "Get Ready",
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
