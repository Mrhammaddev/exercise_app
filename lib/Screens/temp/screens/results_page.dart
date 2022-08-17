// import 'package:atfit_/Screens/temp/components/bottom_button.dart';
// import 'package:atfit_/Screens/temp/components/reusable_card.dart';
// import 'package:atfit_/Screens/temp/constants.dart';
// import 'package:flutter/material.dart';

// class ResultsPage extends StatelessWidget {
//   ResultsPage(
//       {@required this.bmiResult,
//       @required this.interpretation,
//       @required this.resultText});

//   final String bmiResult;
//   final String resultText;
//   final String interpretation;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BMI Calculator'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.all(15.0),
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 'Your Result',
//                 style: kTitleTextStyle,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: ReusableCard(
//               colour: kActiveCardColour,
//               cardChild: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     resultText.toUpperCase(),
//                     style: kResultTextStyle,
//                   ),
//                   Text(
//                     bmiResult,
//                     style: kBMITextStyle,
//                   ),
//                   Text(
//                     interpretation,
//                     textAlign: TextAlign.center,
//                     style: kBodyTextStyle,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           BottomButton(
//             buttonTitle: 'Re Calculate',
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
