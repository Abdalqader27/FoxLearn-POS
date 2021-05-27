import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:simple_animations/simple_animations.dart';

class FancyBackgroundApp extends StatelessWidget {
  final child;

  const FancyBackgroundApp({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Screen.width(15)),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          AnimatedBackground(
            child: child,
          ),
          onBottom(AnimatedWave(height: 180, speed: 1.0)),
          onBottom(AnimatedWave(height: 120, speed: 0.9, offset: pi)),
          onBottom(AnimatedWave(height: 220, speed: 1.2, offset: pi / 2)),
        ],
      ),
    );
  }

  onBottom(Widget child) =>
      Align(alignment: Alignment.bottomCenter, child: child);
}

class AnimatedWave extends StatelessWidget {
  final double height;
  final double speed;
  final double offset;

  AnimatedWave({required this.height, required this.speed, this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: LoopAnimation(
          duration: Duration(milliseconds: (5000 / speed).round()),
          tween: Tween<double>(begin: 0.0, end: (2 * pi)),
          builder: (context, _, double value) {
            return CustomPaint(foregroundPainter: CurvePainter(value + offset));
          }),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double value;

  CurvePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = Colors.white.withAlpha(60);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatedBackground extends StatelessWidget {
  final child;

  const AnimatedBackground({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<DefaultAnimationProperties>()
      ..add(
        DefaultAnimationProperties.color1,
        ColorTween(begin: Color(0xffD38312), end: Colors.lightBlue.shade900),
      )
      ..add(
        DefaultAnimationProperties.color2,
        ColorTween(begin: Color(0xffA83279), end: Colors.blue.shade600),
      );

    return MirrorAnimation<MultiTweenValues<DefaultAnimationProperties>>(
      tween: tween,
      duration: Duration(seconds: 3),
      builder: (context, _, animation) {
        return Container(
          clipBehavior: Clip.antiAlias,
          child: child,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                animation.get(DefaultAnimationProperties.color1),
                animation.get(DefaultAnimationProperties.color2)
              ])),
        );
      },
    );
  }
}
