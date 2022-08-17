import 'package:exercise_app/Screens/help.dart';
import 'package:exercise_app/Screens/privacyAndPolicy.dart';
import 'package:exercise_app/authentication/Controllers/authController.dart';
import 'package:exercise_app/authentication/Controllers/userController.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:exercise_app/widgets/appbar.dart';
import 'package:exercise_app/widgets/settingsList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetWidget<AuthController> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signOut() async {
    try {
      await _auth.signOut();
      Get.back();
      Get.find<UserController>().clear();
    } catch (e) {
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Settings",
        appbar: AppBar(),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/profile.png"),
                      ),
                      // child: Image.asset(
                      //   'assets/profile.png',
                      //   fit: BoxFit.cover,
                      //   // height: 170,
                      // ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 140.0, left: 130),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Color(0XFF4b636e),
                  //     ),
                  //     child: IconButton(
                  //       icon: Icon(
                  //         Icons.edit,
                  //         color: Colors.white,
                  //         size: 33.0,
                  //       ),
                  //       onPressed: () {},
                  //     ),
                  //   ),
                  // ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SETTINGS"),
                    SettingsCard(
                      leadingIcon: Icon(Icons.help),
                      header: "Help",
                      screenName: Help(),
                    ),
                    SettingsCard(
                      leadingIcon: Icon(Icons.policy),
                      header: "Privacy and Policy",
                      screenName: PrivacyAndPolicy(),
                    ),
                    SettingsCard(
                      leadingIcon: Icon(Icons.logout),
                      header: "SignOut",
                      // screenName: ,
                      // screenName: ,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
