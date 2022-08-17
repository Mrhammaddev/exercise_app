import 'package:exercise_app/utils/constants.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  Widget? nextScreen;
  StartButton({this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => nextScreen!,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
                color: kButtonColor, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                'Start',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
