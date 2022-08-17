import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable

class ExerciseCard extends StatelessWidget {
  ExerciseCard({
    required this.titleText,
    required this.backImage,
    this.nextScreen,
  });
  final String titleText;
  final String backImage;
  final Widget? nextScreen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  duration: Duration(milliseconds: 800),
                  ctx: context,
                  inheritTheme: true,
                  child: nextScreen!,
                  // childCurrent: this,
                  type: PageTransitionType.rightToLeftWithFade));
        },
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backImage),
                fit: BoxFit.fitWidth,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.srcOver),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: Text(
              titleText,
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
