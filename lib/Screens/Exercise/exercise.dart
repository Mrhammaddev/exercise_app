import 'package:exercise_app/Screens/Exercise/bodyBuilding.dart';
import 'package:exercise_app/Screens/Exercise/cardio.dart';
import 'package:exercise_app/Screens/Exercise/rehab.dart';
import 'package:exercise_app/Screens/Exercise/yoga.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:exercise_app/widgets/appbar.dart';
import 'package:exercise_app/widgets/mainCard.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Exercise",
        appbar: AppBar(),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              MainCard(
                header: "Body Building",
                titleImage: "assets/body.png",
                screenName: BodyBuilding(),
              ),
              MainCard(
                header: "Cardio",
                titleImage: "assets/cardio.png",
                screenName: Cardio(),
              ),
              MainCard(
                header: "Rehab",
                titleImage: "assets/rehab.png",
                screenName: Rehab(),
              ),
              MainCard(
                header: "Yoga",
                titleImage: "assets/yoga.png",
                screenName: Yoga(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
