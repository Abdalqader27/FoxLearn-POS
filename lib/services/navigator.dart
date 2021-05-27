import 'package:flutter/material.dart';

class AppNavigator {
  static pushReplacement(context, Widget screen) {
    _unFocus(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => screen),
    );
  }

  static push(context, Widget screen) {
    _unFocus(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => screen),
    );
  }

  static _unFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
