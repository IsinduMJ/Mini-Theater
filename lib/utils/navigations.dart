import 'package:flutter/material.dart';

class Navigations {
  static void navigatorTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }

  static void goBack(BuildContext context, Widget widget) {
    Navigator.pop(context);
  }
}
