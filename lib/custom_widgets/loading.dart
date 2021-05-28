import 'package:flutter/material.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Screen.height(175),
        child: Center(
            child: Lottie.asset(
                "assets/lottie/loading.json")));
  }
}
