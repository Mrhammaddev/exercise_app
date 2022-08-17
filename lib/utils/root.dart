// import 'package:atfit_/authentication/Controllers/authController.dart';
// import 'package:atfit_/authentication/Controllers/userController.dart';
// import 'package:atfit_/authentication/Screens/login_root.dart';
// import 'package:atfit_/widgets/bottombar.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// class Root extends GetWidget<AuthController> {
//   @override
//   Widget build(BuildContext context) {
//     return GetX(
//       initState: (_) async {
//         Get.put<UserController>(UserController());
//       },
//       builder: (_) {
//         if (Get.find<AuthController>().user?.uid != null) {
//           return LandingPage();
//         } else {
//           return LoginRoot();
//         }
//       },
//     );
//   }
// }
