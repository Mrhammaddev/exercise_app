import 'package:exercise_app/Screens/Exercise/exercise.dart';
import 'package:exercise_app/Screens/profile.dart';
import 'package:exercise_app/Screens/temp/screens/input_page.dart';
import 'package:exercise_app/utils/constants.dart';
import 'package:exercise_app/widgets/mainCard.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBarColor,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset("assets/exercise_applogo.png"),
        ),
        title: Text(
          "AtFit",
          style: TextStyle(fontSize: 27, fontStyle: FontStyle.italic),
        ),
        actions: [
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 800),
                      child: ProfilePage(),
                      type: PageTransitionType.rightToLeft,
                      inheritTheme: true,
                      ctx: context));
            },
            splashRadius: 20,
          )
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Featured",
                style: TextStyle(fontSize: 22),
              ),
              MainCard(
                header: "Exercise",
                titleImage: "assets/exercise.png",
                screenName: ExercisePage(),
              ),
              MainCard(
                header: "Nutrition",
                titleImage: "assets/diet.png",
                // screenName: InputPage(),
              ),
              // MainCard(
              //   header: "Nutrition",
              //   titleImage: "assets/diet.png",
              //   screenName: MyWidget(),
              // ),
              Text(
                "Health Tips",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 240,
                  child: Row(
                    children: [
                      Tips(
                        title: "Eat Healthy",
                        image:
                            "https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/1-20190529-091438-lr.tmb-1366v.jpg?sfvrsn=9ba890c9_2",
                      ),
                      Tips(
                        title: "Consume less salt and sugar",
                        image:
                            "https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/2-who-056764-orig.tmb-1366v.jpg?sfvrsn=c20a162e_2",
                      ),
                      Tips(
                        title: "Reduce intake of harmful fats",
                        image:
                            "https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/3-who-056149-img.tmb-1366v.jpg?sfvrsn=c0dc2291_2",
                      ),
                      Tips(
                        title: "Be Active",
                        image:
                            "https://www.who.int/images/default-source/wpro/countries/philippines/feature-stories/6-f2-300032016-ph-06573-lr.tmb-1366v.jpg?sfvrsn=f4bc39b4_2",
                      )
                    ],
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

class Tips extends StatelessWidget {
  Tips({
    this.title,
    this.image,
    Key? key,
  }) : super(key: key);
  String? image;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 3,
              blurRadius: 8,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(
              (image!),
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.srcOver),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 20,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text("Show Video",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
