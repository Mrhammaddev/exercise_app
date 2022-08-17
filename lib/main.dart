import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'authentication/Controllers/bindings/bindings.dart';
import 'authentication/Controllers/userController.dart';
import 'authentication/Screens/login_root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(() => UserController());
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   textTheme: GoogleFonts.titilliumWebTextTheme(
      //     Theme.of(context).textTheme,
      //   ),
      // ),
      home: LoginRoot(),
    );
  }
}
