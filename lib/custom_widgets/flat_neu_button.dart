import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/services/screen.dart';

class FlatNeuButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;
  final double depth;

  const FlatNeuButton(
      {Key? key,
      this.child,
      this.onTap,
      this.color,
      this.borderColor,
      this.depth = 0.5})
      : super(key: key);

  factory FlatNeuButton.icon(
      {Key? key,
      IconData? iconData,
      VoidCallback? onTap,
      Color? color,
      Color? borderColor}) {
    return _FlatNeuButtonWithIcon(
      color: color,
      onTap: onTap,
      borderColor: borderColor,
      icon: iconData,
    );
  }

  factory FlatNeuButton.title(
      {Key? key,
      String? text,
      VoidCallback? onTap,
      Color? color,
      Color? borderColor}) {
    return _FlatNeuButtonWithTitle(
      text: text,
      color: color,
      onTap: onTap,
      borderColor: borderColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      style: NeumorphicStyle(
          lightSource: LightSource.top,
          intensity: 0.8,
          color: color,
          shape: NeumorphicShape.flat,
          border: borderColor == null
              ? NeumorphicBorder(color: color!.withOpacity(0.5), width: 3)
              : NeumorphicBorder.none(),
          shadowDarkColor: Colors.black.withOpacity(0.2),
          depth: depth),
      child: child,
    );
  }
}

class _FlatNeuButtonWithIcon extends FlatNeuButton {
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;

  const _FlatNeuButtonWithIcon(
      {Key? key, this.icon, this.onTap, this.color, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => NeumorphicButton(
      onPressed: onTap,
      style: NeumorphicStyle(
          lightSource: LightSource.top,
          intensity: 0.6,
          color: color,
          shape: NeumorphicShape.flat,
          shadowLightColor: color!.withOpacity(0.6),
          border: NeumorphicBorder(color: color!.withOpacity(0.5), width: 3),
          shadowDarkColor: Colors.black.withOpacity(0.4),
          depth: 8),
      child: Icon(
        icon,
        size: Screen.width(25),
      ));
}

class _FlatNeuButtonWithTitle extends FlatNeuButton {
  final String? text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;

  _FlatNeuButtonWithTitle(
      {this.text, this.onTap, this.color, this.borderColor});

  @override
  Widget build(BuildContext context) => NeumorphicButton(
      onPressed: onTap,
      style: NeumorphicStyle(
          lightSource: LightSource.top,
          intensity: 0.3,
          color: color,
          shape: NeumorphicShape.flat,
          shadowLightColor: color!.withOpacity(0.6),
          border: NeumorphicBorder(color: color!.withOpacity(0.5), width: 3),
          shadowDarkColor: Colors.black.withOpacity(0.4),
          depth: 8),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: AppTextStyles.medium().copyWith(fontWeight: FontWeight.bold),
          )));
}
