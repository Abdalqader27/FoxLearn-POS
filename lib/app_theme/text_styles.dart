import 'package:flutter/material.dart';

class AppTextStyles {
  static late double screenWidth;

  static TextStyle verySmall() =>
      TextStyle(fontSize: setSp(11), fontFamily: 'sst-arabic');

  static TextStyle small() =>
      TextStyle(fontSize: setSp(13), fontFamily: 'sst-arabic');

  static TextStyle medium() => TextStyle(
      fontSize: setSp(16),
      fontFamily: 'sst-arabic',
      fontWeight: FontWeight.w600);

  static TextStyle listTitle() => TextStyle(
      fontSize: setSp(18),
      fontWeight: FontWeight.bold,
      fontFamily: 'sst-arabic');

  static TextStyle title() => TextStyle(
      fontSize: setSp(24),
      fontWeight: FontWeight.bold,
      fontFamily: 'sst-arabic');

  static TextStyle appBarTitle() {
    return TextStyle(
      fontSize: setSp(20),
      fontWeight: FontWeight.bold,
      fontFamily: 'sst-arabic',
    );
  }

  static TextStyle bigTitle() =>
      TextStyle(fontSize: setSp(32), fontWeight: FontWeight.bold);

  static setSp(double size) => screenWidth * (size / 400 * 100) / 100;
}
