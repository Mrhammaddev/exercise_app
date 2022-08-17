import 'package:exercise_app/utils/constants.dart';
import 'package:flutter/material.dart';

class TextGetter extends StatelessWidget {
  final String lblText;
  final Icon iconlbl;
  TextGetter({required this.lblText, required this.iconlbl});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: iconlbl,
          hintText: lblText,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black38,
            // fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: kLightColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        ),
      ),
    );
  }
}
