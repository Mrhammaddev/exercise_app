// ignore_for_file: prefer_const_constructors

import 'package:exercise_app/Screens/home.dart';
import 'package:exercise_app/authentication/Controllers/authController.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1C1C1C),
            height: 2,
          ),
        ),
        Text(
          "AtFit",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1C1C),
            letterSpacing: 2,
            height: 1,
          ),
        ),
        Text(
          "Please login to continue",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1C1C1C),
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          // validator: (value) {
          //   if (!value.contains('@') || !value.endsWith('.com')) {
          //     return "Invalid Email";
          //   }
          //   return null;
          // },
          controller: emailController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff29434e),
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            // fillColor: Color(0xff718792),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: passwordController,
          obscureText: _isObscure,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff29434e),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            // fillColor: Color(0xff718792),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    duration: Duration(milliseconds: 800),
                    child: HomePage(),
                    type: PageTransitionType.rightToLeft,
                    inheritTheme: true,
                    ctx: context));
            // controller.login(emailController.text, passwordController.text);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => LandingPage()));
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: kButtonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF1C1C1C).withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "FORGOT PASSWORD?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1C1C),
            height: 1,
          ),
        ),
      ],
    );
  }
}
