import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn_pos/generated/assets.dart';
import 'package:foxlearn_pos/services/screen.dart';


class NotificationCircleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Assets.svgNotificationScreenHeader,
      child: CircleAvatar(
        radius: Screen.width(70),
        child: SvgPicture.asset(
          Assets.svgNotificationScreenHeader,
          height: Screen.width(110),
        ),
      ),
    );
  }
}
