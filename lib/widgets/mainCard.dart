import 'package:exercise_app/utils/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:page_transition/page_transition.dart';

class MainCard extends StatelessWidget {
  Widget? screenName;
  String? header;
  String? titleImage;
  MainCard({this.header, this.titleImage, this.screenName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 500,
            child: NeumorphicButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    header!,
                    style: h1TextStyle,
                  ),
                  Image.asset(titleImage!)
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        curve: Curves.bounceInOut,
                        duration: Duration(milliseconds: 800),
                        child: screenName!,
                        type: PageTransitionType.rightToLeftWithFade,
                        inheritTheme: true,
                        ctx: context));
              },
              style: NeumorphicStyle(
                color: kCardColor,
                shape: NeumorphicShape.flat,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
