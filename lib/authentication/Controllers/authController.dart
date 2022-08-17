import 'package:exercise_app/Screens/home.dart';
import 'package:exercise_app/authentication/Controllers/userController.dart';
import 'package:exercise_app/authentication/Services/database.dart';
import 'package:exercise_app/models/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  @override
  onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> createUser(
      String name, String email, String password, String uid) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        email: _authResult.user!.email!,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.to(() => HomePage());
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.to(HomePage());
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user!.uid);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Signing In', e.toString(),
          backgroundColor: Colors.white.withOpacity(0.7),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.back();
      Get.find<UserController>().clear();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Signing Out', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
