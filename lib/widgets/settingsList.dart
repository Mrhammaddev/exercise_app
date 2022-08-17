import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SettingsCard extends StatelessWidget {
  Widget? screenName;
  Widget? leadingIcon;
  String? header;
  SettingsCard({this.header, this.screenName, this.leadingIcon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 500,
            child: NeumorphicButton(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leadingIcon!,
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    header!,
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => screenName!));
              },
              style: NeumorphicStyle(
                color: Color(0xffe8f1f5),
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
