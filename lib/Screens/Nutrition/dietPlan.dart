import 'package:exercise_app/Screens/Exercise/body/arm.dart';
import 'package:exercise_app/models/meals_list_data.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:exercise_app/widgets/mealsCard.dart';
import 'package:exercise_app/widgets/waterReminder.dart';
import 'package:flutter/material.dart';

class DietPlan extends StatefulWidget {
  // const DietPlan({Key key, this.animationController});
  // final AnimationController animationController;
  @override
  _DietPlanState createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  List<MealsListData> mealsListData = MealsListData.tabIconList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: Colors.transparent,
            )),
        backgroundColor: kBarColor,
        centerTitle: true,
        title: Text("Diet Plan"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              children: [
                Text(
                  "Meals",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   height: 210,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: mealsListData.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return MealsCardDisplay(
          //         mealsListData: mealsListData[index],
          //         nextScreen: ArmB(),
          //       );
          //     },
          //   ),
          // ),
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                "https://images.unsplash.com/photo-1513442542250-854d436a73f2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=558&q=80",
              )),
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: grey.withOpacity(0.2),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 10.0),
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Breakfast",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              children: [
                Text(
                  "Water",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          WaterReminder(),
        ],
      ),
    );
  }
}
