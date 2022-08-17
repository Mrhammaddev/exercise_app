// import 'package:exercise_app/Screens/Nutrition/bmi/calculator.dart';
// import 'package:exercise_app/Screens/Nutrition/weight.dart';
// import 'package:exercise_app/models/gender.dart';
// import 'package:exercise_app/widgets/appbar.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

// class ResultPage extends StatefulWidget {
//    int height;
//    int weight;
//    Gender gender;

//    ResultPage({Key? key,required this.height,required this.weight,required this.gender})
//       : super(key: key);

//   @override
//   _ResultPageState createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: "Result",
//         appbar: AppBar(),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           ResultCard(
//             bmi: calculateBMI(height: widget.height, weight: widget.weight),
//             minWeight: calculateMinNormalWeight(height: widget.height),
//             maxWeight: calculateMaxNormalWeight(height: widget.height),
//           ),
//           _buildBottomBar(),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomBar() {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 30.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           // Padding(
//           //   padding: const EdgeInsets.only(right: 40.0),
//           //   child: IconButton(
//           //     icon: Icon(
//           //       Icons.delete,
//           //       color: Colors.grey,
//           //       size: 28.0,
//           //     ),
//           //     onPressed: () => Navigator.of(context).pop(),
//           //   ),
//           // ),
//           Container(
//             height: 50,
//             width: 100,
//             child: NeumorphicButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Center(child: Icon(Icons.repeat)),
//               style: NeumorphicStyle(),
//             ),
//           ),
//           SizedBox(
//             width: 30,
//           ),
//           Container(
//             height: 50,
//             width: 100,
//             child: NeumorphicButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (_) => WeightSelector()));
//               },
//               child: Center(
//                   child: Text(
//                 "Next",
//                 style: TextStyle(fontSize: 20),
//               )),
//               style: NeumorphicStyle(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ResultCard extends StatelessWidget {
//   final double bmi;
//   final double minWeight;
//   final double maxWeight;

//   ResultCard({Key key, this.bmi, this.minWeight, this.maxWeight})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(16.0),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 24.0),
//         child: Container(
//           width: double.infinity,
//           child: Column(children: [
//             // Text(
//             //   '🔥',
//             //   style: TextStyle(fontSize: 80.0),
//             // ),
//             Text(
//               bmi.toStringAsFixed(1),
//               style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'BMI = ${bmi.toStringAsFixed(2)} kg/m²',
//               style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 16.0),
//               child: Text(
//                 'Normal BMI weight range for the height:\n${minWeight.round()}kg - ${maxWeight.round()}kg',
//                 style: TextStyle(fontSize: 14.0, color: Colors.grey),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
