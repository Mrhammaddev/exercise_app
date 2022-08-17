// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exercise_app/utils/constants.dart';
import 'package:exercise_app/utils/hexColor.dart';
import 'package:exercise_app/utils/waveView.dart';
import 'package:exercise_app/widgets/dialogeCompletedBox.dart';
import 'package:flutter/material.dart';

class WaterReminder extends StatefulWidget {
  WaterReminder(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  AnimationController? mainScreenAnimationController;
  Animation<dynamic>? mainScreenAnimation;

  @override
  _WaterReminderState createState() => _WaterReminderState();
}

class _WaterReminderState extends State<WaterReminder>
    with TickerProviderStateMixin {
  // Future<bool> getData() async {
  //   await Future<dynamic>.delayed(const Duration(milliseconds: 50));
  //   return true;
  // }

  double increment = 0;
  var time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0, bottom: 3),
                              child: Text(
                                '2100',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
                                  color: nearlyDarkBlue,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, bottom: 8),
                              child: Text(
                                'ml',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  letterSpacing: -0.2,
                                  color: nearlyDarkBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'of daily goal 3.5L',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: 0.0,
                            color: darkText,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      endIndent: 50,
                      // thickness: 5,
                      color: nearlyDarkBlue,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: grey.withOpacity(0.5),
                              size: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                'Last drink ${time.hour}:${time.minute}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  color: grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        increment == 00
                            ? Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: Image.asset(
                                          'assets/nutrition/bell.png'),
                                    ),
                                    Flexible(
                                      child: Text(
                                        'Your bottle is empty, refill it!.',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          letterSpacing: 0.0,
                                          color: HexColor('#F65283'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (increment == 100) {
                            showGeneralDialog(
                              barrierColor: Colors.black.withOpacity(0.5),
                              transitionBuilder: (context, a1, a2, widget) {
                                final curvedValue =
                                    Curves.easeInOutBack.transform(a1.value) -
                                        1.0;
                                return Transform(
                                  transform: Matrix4.translationValues(
                                      0.0, curvedValue * 200, 0.0),
                                  child: Opacity(
                                    opacity: a1.value,
                                    child: DialogCompletedBox(
                                      title: "Congratulations!",
                                      choticLine:
                                          "You have completed your per day drinks.",
                                      emoji: "🎉",
                                    ),
                                  ),
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500),
                              barrierDismissible: true,
                              barrierLabel: '',
                              context: context,
                              pageBuilder: (context, animation1, animation2) {
                                return Container();
                              },
                            );
                          } else {
                            increment = increment + 10;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: nearlyWhite,
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: nearlyDarkBlue.withOpacity(0.4),
                                offset: const Offset(4.0, 4.0),
                                blurRadius: 8.0),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.add,
                            color: nearlyDarkBlue,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (increment <= 0) {
                            showGeneralDialog(
                              barrierColor: Colors.black.withOpacity(0.5),
                              transitionBuilder: (context, a1, a2, widget) {
                                final curvedValue =
                                    Curves.easeInOutBack.transform(a1.value) -
                                        1.0;
                                return Transform(
                                  transform: Matrix4.translationValues(
                                      0.0, curvedValue * 200, 0.0),
                                  child: Opacity(
                                    opacity: a1.value,
                                    child: DialogCompletedBox(
                                      title: "OOPS!",
                                      choticLine: "Fill your bottle",
                                      emoji: "",
                                    ),
                                  ),
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500),
                              barrierDismissible: true,
                              barrierLabel: '',
                              context: context,
                              pageBuilder: (context, animation1, animation2) {
                                return Container();
                              },
                            );
                          } else {
                            increment = increment - 10;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: nearlyWhite,
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: nearlyDarkBlue.withOpacity(0.4),
                                offset: const Offset(4.0, 4.0),
                                blurRadius: 8.0),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.remove,
                            color: nearlyDarkBlue,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8, top: 16),
                child: Container(
                  width: 60,
                  height: 160,
                  decoration: BoxDecoration(
                    color: HexColor('#E8EDFE'),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0),
                        topRight: Radius.circular(80.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: grey.withOpacity(0.4),
                          offset: const Offset(2, 2),
                          blurRadius: 4),
                    ],
                  ),
                  child: WaveView(
                    percentageValue: increment,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
