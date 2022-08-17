// import 'package:atfit_/Screens/Report.dart';
// import 'package:atfit_/Screens/home.dart';
// import 'package:atfit_/Screens/profile.dart';
// import 'package:atfit_/utils/constants.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';

// class LandingPage extends StatefulWidget {
//   @override
//   _LandingPageState createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   int _currentIndex = 0;
//   final List<Widget> _children = [HomePage(), ReportPage(), ProfilePage()];

//   void OnTappedBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[_currentIndex],
//       bottomNavigationBar: ConvexAppBar(
//           style: TabStyle.textIn,
//           // curve: Curves.easeInOut,
//           onTap: OnTappedBar,
//           initialActiveIndex: _currentIndex,
//           backgroundColor: kBarColor,
//           color: Colors.white,
//           height: 50,
//           top: -20,
//           items: [
//             TabItem(
//               icon: Icons.home,
//               title: 'Home',
//             ),
//             TabItem(icon: Icons.bar_chart, title: 'Report'),
//             TabItem(icon: Icons.person, title: 'Profile'),
//           ]),
//     );
//   }
// }
