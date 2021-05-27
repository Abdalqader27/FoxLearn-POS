import 'package:flutter/material.dart';

import 'app_theme/text_styles.dart';
import 'services/screen.dart';

class InitScreen extends StatefulWidget {
  final Widget? child;

  const InitScreen({Key? key, this.child}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    _initScreen(context);
    return widget.child!;
  }

  _initScreen(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    double screenWidth;
    double screenHeight;
    if (isLandscape) {
      AppTextStyles.screenWidth = MediaQuery.of(context).size.height;
      screenWidth = mediaQueryData.size.height;
      screenHeight = mediaQueryData.size.width;
    } else {
      AppTextStyles.screenWidth = MediaQuery.of(context).size.width;
      screenWidth = mediaQueryData.size.width;
      screenHeight = mediaQueryData.size.height;
    }
    Screen.size = Size(screenWidth, screenHeight);
    setState(() {});
  }
}
