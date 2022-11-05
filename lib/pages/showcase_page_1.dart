import 'dart:async';

import 'package:flutter/material.dart';

import 'common/showcase_scaffold.dart';

class ShowcaseSimpleAnimation extends StatefulWidget {
  const ShowcaseSimpleAnimation({Key? key}) : super(key: key);

  @override
  State<ShowcaseSimpleAnimation> createState() =>
      _ShowcaseSimpleAnimationState();
}

class _ShowcaseSimpleAnimationState extends State<ShowcaseSimpleAnimation> {
  Offset offset = Offset.zero;
  Offset direction = const Offset(3, 3);
  Size size = const Size(64, 64);

  void _animationStep(double width, double height) {
    offset += direction;
    if (offset.dx + size.width >= width || offset.dx <= 0) {
      direction = Offset(-direction.dx, direction.dy);
    }
    if (offset.dy + size.height >= height || offset.dy <= 0) {
      direction = Offset(direction.dx, -direction.dy);
    }
  }

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  double _bodyHeight = 0;
  double _bodyWidth = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_timer != null) {
      _timer?.cancel();
      _run();
    }
    final mq = MediaQuery.of(context);
    _bodyHeight = mq.size.height -
        mq.viewInsets.top -
        mq.viewInsets.bottom -
        kBottomNavigationBarHeight -
        kToolbarHeight -
        mq.padding.top -
        mq.padding.bottom -
        16;
    _bodyWidth = mq.size.width;
  }

  void _run() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000.0 ~/ 60), (_) {
      _animationStep(_bodyWidth, _bodyHeight);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      onRun: _run,
      child: Stack(
        children: [
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
