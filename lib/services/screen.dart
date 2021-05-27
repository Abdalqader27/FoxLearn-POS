import 'package:flutter/material.dart';

class Screen {
  static bool isInit = false;
  static late Size size;

  static double height(double height) => size.height * (height / 800 * 100) / 100;

  static double width(double width) => size.width * (width / 400 * 100) / 100;
}
