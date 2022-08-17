import 'package:exercise_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WeightSelector extends StatefulWidget {
  var num;
  WeightSelector({Key? key}) : super(key: key);

  @override
  _WeightSelectorState createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  final weightControllerKg = new TextEditingController();

  var pound;

  _calculateCalories() {
    final kgValue = double.parse(weightControllerKg.text);

    pound = kgValue * 26.4;

    print(pound);
  }

  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create your Diet Plan"),
        backgroundColor: kBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your Desired Weight",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: weightControllerKg,
              decoration: InputDecoration(
                hintText: "Weight in kg",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                  // fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[250],
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Enter your target days", style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            pound == null
                ? Text(
                    "Required Calories: ",
                    style: TextStyle(fontSize: 20),
                  )
                : Text("Required Calories: $pound",
                    style: TextStyle(fontSize: 20)),
            // _dropdownButtonWithhint(),
            MaterialButton(
              onPressed: () {
                setState(
                  () {
                    if (weightControllerKg.text == null) {
                      SnackBar(
                        content: Text("Please enter your desired Weight!"),
                      );
                    } else {
                      return _calculateCalories();
                    }
                  },
                );
              },
              child: Text("submit"),
              color: Colors.red,
            ),
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 0,
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       Text(
      //         'Please choose your diet Plan.',
      //         style: TextStyle(
      //           color: Colors.blueGrey[800],
      //           fontSize: 20.0,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       SizedBox(
      //         height: 50,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           FoodTypeCard(
      //             mainImage: 'assets/weight_gain.png',
      //             title: 'Weight Gain',
      //             isSelected: _isWeightGain,
      //             onPress: () {
      //               setState(
      //                 () {
      //                   if (_isWeightGain == false) {
      //                     _isWeightGain = true;
      //                     _isWeightLoss = false;
      //                   }
      //                 },
      //               );
      //             },
      //           ),
      //           FoodTypeCard(
      //             mainImage: 'assets/weight_loss.png',
      //             title: 'Weight Loss',
      //             isSelected: _isWeightLoss,
      //             onPress: () {
      //               setState(() {
      //                 if (_isWeightLoss == false) {
      //                   _isWeightLoss = true;
      //                   _isWeightGain = false;
      //                 }
      //               });
      //             },
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 50,
      //       ),
      //       Text("Your current Weight:"),
      //       Container(
      //         height: 50,
      //         width: 100,
      //         child: NeumorphicButton(
      //           onPressed: () {
      //             if (_isWeightGain == false && _isWeightLoss == false) {
      //               return showGeneralDialog(
      //                 barrierColor: Colors.black.withOpacity(0.5),
      //                 transitionBuilder: (context, a1, a2, widget) {
      //                   final curvedValue =
      //                       Curves.easeInOutBack.transform(a1.value) - 1.0;
      //                   return Transform(
      //                     transform: Matrix4.translationValues(
      //                         0.0, curvedValue * 200, 0.0),
      //                     child: Opacity(
      //                       opacity: a1.value,
      //                       child: DialogCompletedBox(
      //                         title: "Error",
      //                         choticLine: "Please select your weight goal",
      //                         emoji: "🙁",
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 transitionDuration: Duration(milliseconds: 500),
      //                 barrierDismissible: true,
      //                 barrierLabel: '',
      //                 context: context,
      //                 pageBuilder: (context, animation1, animation2) {
      //                   return null;
      //                 },
      //               );
      //             } else {
      //               return Navigator.push(
      //                   context,
      //                   PageTransition(
      //                       duration: Duration(milliseconds: 900),
      //                       child: DietPlan(),
      //                       type: PageTransitionType.bottomToTop,
      //                       ctx: context,
      //                       inheritTheme: true));
      //             }
      //           },
      //           child: Center(
      //               child: Text(
      //             "Next",
      //             style: TextStyle(fontSize: 20),
      //           )),
      //           style: NeumorphicStyle(),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

//   DropdownButton<int> _dropdownButtonWithhint() {
//     return DropdownButton(
//         // style: _textStyle,
//         value: _value,
//         hint: Text("Choose Any"),
//         items: [
//           DropdownMenuItem(
//               value: 0,
//               child: Text(
//                 "One Week",
//               )),
//           DropdownMenuItem(
//               value: 1,
//               child: Text(
//                 "Two Weeks",
//               )),
//           DropdownMenuItem(
//               value: 2,
//               child: Text(
//                 "Three Weeks",
//               )),
//           DropdownMenuItem(
//               value: 3,
//               child: Text(
//                 "One Month",
//               )),
//           DropdownMenuItem(
//               value: 3,
//               child: Text(
//                 "Two Months",
//               )),
//         ],
//         onChanged: (val) {
//           setState(() {
//             _value = val;
//           });
//         });
//   }
// }

// class FoodTypeCard extends StatelessWidget {
//   const FoodTypeCard({
//     this.mainImage,
//     this.title,
//     this.isSelected,
//     this.onPress,
//   });

//   final String mainImage;
//   final String title;
//   final bool isSelected;
//   final Function onPress;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: GestureDetector(
//         onTap: onPress,
//         child: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.2,
//               // width: MediaQuery.of(context).size.width * 0.4,
//               decoration: BoxDecoration(
//                 color: isSelected ? kLightColor : Colors.grey[200],
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               child: Image.asset(mainImage),
//             ),
//             Text(title)
//           ],
//         ),
//       ),
//     );
//   }
// }

