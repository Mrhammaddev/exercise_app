import 'package:flutter/material.dart';

class DialogCompletedBox extends StatelessWidget {
  DialogCompletedBox({Key? key, this.title, this.choticLine, this.emoji})
      : super(key: key);
  String? title;
  String? choticLine;
  String? emoji;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        title!,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                choticLine!,
                style: TextStyle(
                    // fontSize: 2,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                emoji!,
                style: TextStyle(color: Colors.white, fontSize: 60),
              )
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      actions: [
        MaterialButton(
          child: Text(
            'Got it',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
