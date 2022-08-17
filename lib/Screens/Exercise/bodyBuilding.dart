import 'package:exercise_app/Screens/Exercise/body/arm.dart';
import 'package:exercise_app/Screens/Exercise/body/chest.dart';
import 'package:exercise_app/Screens/Exercise/body/legs.dart';
import 'package:exercise_app/Screens/Exercise/body/shoulder.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:exercise_app/widgets/appbar.dart';
import 'package:exercise_app/widgets/exerciseCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyBuilding extends StatefulWidget {
  _BodyBuildingState createState() => _BodyBuildingState();
}

class _BodyBuildingState extends State<BodyBuilding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Body Building",
        appbar: AppBar(),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              ExerciseCard(
                titleText: "Arm",
                backImage: "assets/arm.jpg",
                nextScreen: ArmB(),
              ),
              ExerciseCard(
                titleText: "Chest",
                backImage: "assets/chest.jpg",
                nextScreen: ChestB(),
              ),
              ExerciseCard(
                titleText: "Shoulder",
                backImage: "assets/shoulder.jpg",
                nextScreen: ShoulderB(),
              ),
              ExerciseCard(
                titleText: "Legs",
                backImage: "assets/legs.jpg",
                nextScreen: LegsB(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
