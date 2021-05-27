import 'package:flutter/material.dart';
import 'package:foxlearn_pos/services/screen.dart';

class SocialIcon extends StatelessWidget {
  final onTap;
  final IconData icon;
  final double? delay;

  const SocialIcon({Key? key, this.onTap, required this.icon, this.delay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RawMaterialButton(
        shape: CircleBorder(),
        constraints: BoxConstraints(minWidth: 0, minHeight: 0),
        padding: EdgeInsets.all(Screen.width(8)),
        splashColor: Color(0xffA83279),
        fillColor: Colors.white.withOpacity(0.8),
        onPressed: onTap,
        child: Icon(
          icon,
          size: Screen.width(23),
          color: Colors.black54,
        ),
      ),
    );
    // return Container(
    //   padding: EdgeInsets.all(Screen.width(12)),
    //   decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.8)),
    //   child: InkWell(
    //     // whats app
    //     child: Icon(
    //       icon,o
    //       size: Screen.width(23),
    //       color: Colors.black54,
    //     ),
    //     onTap: onTap,
    //   ),
    // );
  }
}
