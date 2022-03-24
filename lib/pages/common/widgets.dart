import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColoredCircle extends StatelessWidget {
  final double radius;
  final Color color;

  const ColoredCircle({
    required this.radius,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: SizedBox.fromSize(
        size: Size.fromRadius(radius),
      ),
    );
  }
}

class DropPageTransition extends PageTransitionsBuilder {
  const DropPageTransition();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (animation.status == AnimationStatus.forward) {
      child = ScaleTransition(
        scale: animation.drive(Tween(begin: 2.0, end: 1.0)),
        child: child,
      );
    }

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
