import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';

class CustomNeumorphic extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? intensity;
  final double? depth;

  const CustomNeumorphic(
      {Key? key, this.child, this.color, this.intensity, this.depth})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          depth: depth ??2,
          lightSource: LightSource.topLeft,
          intensity: intensity ?? 1,
          shadowLightColor: Colors.white,
          boxShape: NeumorphicBoxShape.beveled(BorderRadius.only(
              bottomRight: Radius.circular(25), topLeft: Radius.circular(25))),
          shadowDarkColor: Colors.black.withOpacity(0.26),
          color: color ?? Theme.of(context).cardColor),
      child: child);
}
