// import 'package:atfit_/utils/widget_utils.dart';
// import 'package:flutter/material.dart';

// import 'gender_styles.dart';

// class GenderArrow extends AnimatedWidget {
//   const GenderArrow({Key key, Listenable listenable})
//       : super(key: key, listenable: listenable);

//   double _arrowLength(BuildContext context) => screenAwareSize(32.0, context);

//   double _translationOffset(BuildContext context) =>
//       _arrowLength(context) * -0.4;

//   @override
//   Widget build(BuildContext context) {
//     Animation animation = listenable;
//     return Transform.rotate(
//       angle: animation.value,
//       child: Transform.translate(
//         offset: Offset(0.0, _translationOffset(context)),
//         child: Transform.rotate(
//           angle: -defaultGenderAngle,
//           child: Image.asset(
//             "assets/bmi/gender_arrow.png",
//             height: _arrowLength(context),
//             width: _arrowLength(context),
//           ),
//         ),
//       ),
//     );
//   }
// }
