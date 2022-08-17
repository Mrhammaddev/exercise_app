import 'package:exercise_app/Screens/Exercise/exerciseScreens/exerciseExecution.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:exercise_app/widgets/listExercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Rehab extends StatefulWidget {
  @override
  _RehabState createState() => _RehabState();
}

class _RehabState extends State<Rehab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Rehab',
                ),
                background: Image.asset(
                  'assets/cardio_sliver.jpg',
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
              .collection("rehabList")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null)
              return Center(child: CircularProgressIndicator());
            var list = snapshot.data!.docs;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListExercise(
                  list: list,
                  title: list[index].get("name"),
                  time: "-",
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
