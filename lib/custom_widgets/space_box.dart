import 'package:flutter/material.dart';
import 'package:foxlearn_pos/services/screen.dart';

class SpaceBox extends StatelessWidget {
  final double width;
  final double height;

  const SpaceBox({Key? key, this.width = 0, this.height = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: Screen.height(height), width: Screen.width(width));
}
