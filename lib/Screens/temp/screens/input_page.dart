// import 'dart:math';

// import 'package:atfit_/Screens/Nutrition/dietPlan.dart';
// import 'package:atfit_/Screens/temp/components/bottom_button.dart';
// import 'package:atfit_/Screens/temp/components/reusable_card.dart';
// import 'package:atfit_/Screens/temp/components/round_icon_button.dart';
// import 'package:atfit_/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

// // enum Gender {
// //   male,
// //   female,
// // }

// class InputPage extends StatefulWidget {
//   @override
//   _InputPageState createState() => _InputPageState();
// }

// class _InputPageState extends State<InputPage> {
//   // Gender selectedGender;
//   int height = 180;
//   int weight = 60;
//   double _bmi = 0;
//   bool isVisisble = false;

//   final weightControllerKg = new TextEditingController();
//   var pound;

//   _calculateCalories() {
//     final kgValue = double.parse(weightControllerKg.text);

//     pound = kgValue * 26.4;

//     print(pound);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: kBarColor,
//         title: Text('BMI Calculator'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             ReusableCard(
//               colour: kActiveCardColour,
//               cardChild: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'HEIGHT',
//                     style: kLabelTexStyle,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline.alphabetic,
//                     children: [
//                       Text(
//                         height.toString(),
//                         style: kNumberTextStyle,
//                       ),
//                       Text(
//                         'cm',
//                         style: kLabelTexStyle,
//                       )
//                     ],
//                   ),
//                   SliderTheme(
//                     data: SliderTheme.of(context).copyWith(
//                       inactiveTrackColor: Color(0xFF8DBE98),
//                       activeTrackColor: Colors.black26,
//                       thumbColor: kBarColor,
//                       // overlayColor: Color(0x29EB1555),
//                       thumbShape:
//                           RoundSliderThumbShape(enabledThumbRadius: 10.0),
//                       overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
//                     ),
//                     child: Slider(
//                       value: height.toDouble(),
//                       min: 120.0,
//                       max: 220.0,
//                       onChanged: (double newValue) {
//                         setState(() {
//                           height = newValue.round();
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ReusableCard(
//                   colour: kActiveCardColour,
//                   cardChild: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'WEIGHT',
//                         style: kLabelTexStyle,
//                       ),
//                       Text(
//                         weight.toString(),
//                         style: kNumberTextStyle,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             RoundIconButton(
//                               icon: Icon(Icons.remove),
//                               onPressed: () {
//                                 setState(() {
//                                   weight--;
//                                 });
//                               },
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             RoundIconButton(
//                               icon: Icon(Icons.add),
//                               onPressed: () {
//                                 setState(() {
//                                   weight++;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   BottomButton(
//                       onTap: () {
//                         // CalculatorBrain calc =
//                         //     CalculatorBrain(height: height, weight: weight);
//                         setState(() {
//                           _bmi = weight / pow(height / 100, 2);
//                           String getResult() {
//                             if (_bmi >= 25) {
//                               return 'Overweight';
//                             } else if (_bmi > 18.5) {
//                               return 'Normal';
//                             } else {
//                               return 'Underweight';
//                             }
//                           }

//                           String getInterpretation() {
//                             if (_bmi >= 25) {
//                               return 'You have a higher than normal body weight. Try to exercise more';
//                             } else if (_bmi > 18.5) {
//                               return 'Yu have a normal body weight. Good job!';
//                             } else {
//                               return 'You have a lower than normal body weight. You can eat a bit more.';
//                             }
//                           }

//                           showGeneralDialog(
//                             barrierColor: Colors.black.withOpacity(0.5),
//                             transitionBuilder: (context, a1, a2, widget) {
//                               final curvedValue =
//                                   Curves.easeInOutBack.transform(a1.value) -
//                                       1.0;
//                               return Transform(
//                                 transform: Matrix4.translationValues(
//                                     0.0, curvedValue * 200, 0.0),
//                                 child: Opacity(
//                                   opacity: a1.value,
//                                   child: AlertDialog(
//                                     backgroundColor: kLightColor,
//                                     title: Text(
//                                       "Your Bmi",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     content: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(20.0),
//                                       ),
//                                       // height: MediaQuery.of(context).size.height / 2,
//                                       child: SingleChildScrollView(
//                                         child: Column(
//                                           children: [
//                                             Text(
//                                               "${_bmi.toStringAsFixed(1)}",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 45),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text(
//                                               "Status: ${getResult()}",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 20),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text(
//                                               "${getInterpretation()}",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 20),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                     ),
//                                     actions: [
//                                       MaterialButton(
//                                         child: Text(
//                                           'Got it',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         onPressed: () => Navigator.pop(context),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                             transitionDuration: Duration(milliseconds: 400),
//                             barrierDismissible: true,
//                             barrierLabel: '',
//                             context: context,
//                             pageBuilder: (context, animation1, animation2) {
//                               return null;
//                             },
//                           );
//                         });
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => ResultsPage(
//                         //       bmiResult: calc.calculateBMI(),
//                         //       resultText: calc.getResult(),
//                         //       interpretation: calc.getInterpretation(),
//                         //     ),
//                         //   ),
//                         // );
//                       },
//                       buttonTitle: "Calculate"),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   BottomButton(
//                       onTap: () {
//                         setState(() {
//                           isVisisble = true;
//                         });
//                       },
//                       buttonTitle: "Next"),
//                 ],
//               ),
//             ),
//             // Text("${_bmi.toStringAsFixed(1)}")
//             SizedBox(
//               height: 20,
//             ),
//             AnimatedOpacity(
//               duration: Duration(seconds: 1),
//               opacity: isVisisble ? 1 : 0,
//               child: Container(
//                 height: MediaQuery.of(context).size.height / 3.5,
//                 width: MediaQuery.of(context).size.width / 1.1,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       spreadRadius: 4,
//                       blurRadius: 8,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Your Current Weight is: ${weight}kg",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text("Enter Your Desired Weight",
//                           style: TextStyle(fontSize: 20)),
//                       TextField(
//                         keyboardType: TextInputType.number,
//                         controller: weightControllerKg,
//                         decoration: InputDecoration(
//                           hintText: "Weight in kg",
//                           hintStyle: TextStyle(
//                             fontSize: 16,
//                             color: Colors.black38,
//                             // fontWeight: FontWeight.bold,
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: BorderSide(
//                               width: 0,
//                               style: BorderStyle.none,
//                             ),
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey[250],
//                           contentPadding:
//                               EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       BottomButton(
//                           onTap: () {
//                             _calculateCalories();
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (_) => DietPlan()));
//                           },
//                           buttonTitle: "Next")
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
