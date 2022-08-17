import 'package:exercise_app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ListExercise extends StatelessWidget {
  const ListExercise({
    this.title,
    this.image,
    this.description,
    this.nextScreen,
    this.time,
    Key? key,
    required this.list,
  }) : super(key: key);
  final String? title;
  final String? image;
  final String? description;
  final Widget? nextScreen;
  final String? time;

  final List<QueryDocumentSnapshot> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width * 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                showGeneralDialog(
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionBuilder: (context, a1, a2, widget) {
                    final curvedValue =
                        Curves.easeInOutBack.transform(a1.value) - 1.0;
                    return Transform(
                      transform: Matrix4.translationValues(
                          0.0, curvedValue * 200, 0.0),
                      child: Opacity(
                        opacity: a1.value,
                        child: AlertDialog(
                          backgroundColor: kLightColor,
                          title: Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          content: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 100,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Image.network(image!),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  description!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ]),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          actions: [
                            MaterialButton(
                              child: Text(
                                'Got it',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 400),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {
                    return Container();
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                child: Container(
                  height: 100,
                  width: 170,
                  // decoration:
                  // BoxDecoration(color: kBackgroundColor),
                  child: Image.network(
                    image!,
                    height: MediaQuery.of(context).size.height * 2,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.blue,
                  width: 150,
                  child: Text(
                    title!,
                  ),
                ),
                Text(
                  time!,
                  style: h3,
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.grey[300],
                  // borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          alignment: Alignment.centerRight,
                          duration: Duration(milliseconds: 700),
                          ctx: context,
                          // childCurrent: this,
                          inheritTheme: true,
                          child: nextScreen!,
                          type: PageTransitionType.rightToLeft),
                    );
                  },
                  icon: Icon(Icons.play_arrow)),
            )
          ],
        ),
      ),
    );
  }
}
