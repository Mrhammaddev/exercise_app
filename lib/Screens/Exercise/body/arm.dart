import 'package:exercise_app/Screens/Exercise/exerciseScreens/exerciseExecution.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:exercise_app/widgets/listExercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ArmB extends StatefulWidget {
  @override
  _ArmBState createState() => _ArmBState();
}

class _ArmBState extends State<ArmB> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // bottomNavigationBar: StartButton(
      //   nextScreen: Timer(),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  children: [
                    Text(
                      'ARM',
                    ),
                  ],
                ),
                background: Image.asset(
                  "assets/arm.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              expandedHeight: 180.0,
              backgroundColor: kBarColor,
            ),
          ];
        },
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("atfit")
              .doc("exercise")
              .collection("armList")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null)
              // ignore: prefer_const_constructors
              return Center(child: CircularProgressIndicator());
            var list = snapshot.data!.docs;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListExercise(
                  list: list,
                  title: list[index].get("name"),
                  time: list[index].get("time"),
                  description: list[index].get("description"),
                  image: list[index].get("image"),
                  nextScreen: ExerciseExecution(details: list[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
