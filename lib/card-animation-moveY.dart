import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class CardAnimationY extends StatefulWidget {
  final int? count;
  final int? index;
  final Widget? child;
  const CardAnimationY({Key? key, this.count, this.index, this.child})
      : super(key: key);

  @override
  _CardAnimationYState createState() => _CardAnimationYState();
}

class _CardAnimationYState extends State<CardAnimationY>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;
  late final Animation<Offset> offsetAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval((1 / widget.count!) * widget.index!, 1.0,
            curve: Curves.fastOutSlowIn)));
    offsetAnimation =
        Offset(0, 0.2).tweenTo(Offset(0, 0)).animatedBy(animationController);
    Future.delayed(Duration(milliseconds: 50), () {
      if (mounted) animationController.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        child: widget.child,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: offsetAnimation, child: child));
        });
  }

  @override
  void dispose() {
    animationController.stop();
    animationController.dispose();
    super.dispose();
  }
}
