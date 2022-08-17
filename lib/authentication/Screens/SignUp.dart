import 'package:exercise_app/Screens/home.dart';
import 'package:exercise_app/authentication/Controllers/authController.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController uidController = TextEditingController();

  final bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Sign up with",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFa7c0cd),
            height: 2,
          ),
        ),
        Text(
          "AtFit",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            // color: Color(0xFFa7c0cd),
            letterSpacing: 2,
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xff29434e),
            ),
            hintText: 'Enter Name',
            hintStyle: TextStyle(
              fontSize: 16,
              // color: Color(0xFF3F3C31),
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
            // fillColor: Color(0xFFa7c0cd).withOpacity(0.6),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff29434e),
            ),
            hintText: 'Enter Email',
            hintStyle: TextStyle(
              fontSize: 16,
              // color: Color(0xFF3F3C31),
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
            // fillColor: Color(0xFFa7c0cd).withOpacity(0.6),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          obscureText: _isObscure,
          controller: passwordController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff29434e),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              // color: Color(0xFF3F3C31),
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
            // fillColor: Color(0xFFa7c0cd).withOpacity(0.6),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () async {
            // Get.to(LandingPage());
            await controller.createUser(
                nameController.text,
                emailController.text,
                passwordController.text,
                uidController.text);
            Navigator.push(
                context,
                PageTransition(
                    duration: Duration(milliseconds: 800),
                    child: HomePage(),
                    type: PageTransitionType.scale,
                    inheritTheme: true,
                    ctx: context));
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
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "SIGN UP",
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
          height: 24,
        ),
      ],
    );
  }
}
