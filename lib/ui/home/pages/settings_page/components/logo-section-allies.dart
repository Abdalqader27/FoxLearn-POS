import 'package:flutter/material.dart';
import 'package:foxlearn_pos/services/screen.dart';

class LogoSection extends StatelessWidget {
  final String? logo;

  const LogoSection({Key? key, this.logo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8,
        left: 8,
        bottom: 8,
      ),
      child: Image.asset(
        logo!,
        height: Screen.height(100),
      ),
      // ),
    );
  }
}
