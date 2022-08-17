import 'package:exercise_app/Screens/Exercise/exerciseScreens/exerciseExecution.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:exercise_app/widgets/listExercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChestB extends StatefulWidget {
  @override
  _ChestBState createState() => _ChestBState();
}

class _ChestBState extends State<ChestB> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kBackgroundColor,
      // bottomNavigationBar: ChestStart(
      //   start: Timer(),
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
                title: Text(
                  'CHEST',
                ),
                background: Image.asset(
                  'assets/chest.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              expandedHeight: 180.0,
              backgroundColor: kBarColor,
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 0, blurRadius: 4),
              ],
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("atfit")
                  .doc("exercise")
                  .collection("chestList")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.data == null)
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
        ),
      ),
    );
  }
}
