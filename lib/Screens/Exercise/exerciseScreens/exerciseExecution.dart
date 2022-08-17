import 'dart:async';

import 'package:exercise_app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';

class ExerciseExecution extends StatefulWidget {
  ExerciseExecution({required this.details});
  final DocumentSnapshot details;
  @override
  _ExerciseExecutionState createState() => _ExerciseExecutionState();
}

class _ExerciseExecutionState extends State<ExerciseExecution>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  bool isPlaying = true;
  Timer? _timer;
  int _start = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    startTimer(30);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  void startTimer(int timerDuration) {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _start = timerDuration;
    });
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(() {
        if (_start < 1) {
          timer.cancel();
        } else {
          _start = _start - 1;
        }
      }),
    );
  }

  void pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  void continueTimer() {
    startTimer(_start);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
              Center(
                child: Text(
                  widget.details.get("name"),
                  style: TextStyle(fontSize: 35),
                ),
              ),
              // Text(
              //   "00:$_start",
              //   style: TextStyle(fontSize: 40),
              // ),
              // Center(
              //   child: Countdown(
              //     duration: Duration(seconds: 30),
              //     onFinish: () {
              //       Navigator.pop(context);
              //     },
              //     builder: (BuildContext ctx, Duration remaining) {
              //       return Column(
              //         children: [
              //           Text(
              //             // '0${remaining.inMinutes}:${remaining.inSeconds}',
              //             "00:$_start",
              //             style: TextStyle(fontSize: 40),
              //           ),
              //         ],
              //       );
              //     },
              //   ),
              // ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
                  child: Container(
                    height: 300,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Image.network(widget.details.get("image")),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // IconButton(
                  //     splashRadius: 25,
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.arrow_left_sharp,
                  //       size: 35,
                  //     )),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ], shape: BoxShape.circle, color: Colors.grey[300]),
                    child: IconButton(
                      splashRadius: 25,
                      iconSize: 32,
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.pause_play,
                        progress: _animationController!,
                      ),
                      onPressed: () => _handleOnPressed(),
                    ),
                  ),
                  // IconButton(
                  //     splashRadius: 25,
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.arrow_right_sharp,
                  //       size: 35,
                  //     )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleOnPressed() {
    setState(
      () {
        if (isPlaying = !isPlaying) {
          _animationController!.forward();
          pauseTimer();
        } else {
          _animationController!.reverse();
          continueTimer();
        }
      },
    );
  }
}
