import 'package:exercise_app/utils/constants.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  AppBar? appbar;
  BaseAppBar({
    this.title,
    this.appbar,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title!,
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      backgroundColor: kBarColor,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appbar!.preferredSize.height);
}
