import 'dart:math';

import 'package:flutter/material.dart';

import 'common/showcase_scaffold.dart';

/// Showcase of [TweenAnimationBuilder] usage
class ShowcaseTweenAnimationBuilder extends StatefulWidget {
  const ShowcaseTweenAnimationBuilder({
    Key? key,
  }) : super(key: key);

  @override
  _ShowcaseTweenAnimationBuilderState createState() =>
      _ShowcaseTweenAnimationBuilderState();
}

class _ShowcaseTweenAnimationBuilderState
    extends State<ShowcaseTweenAnimationBuilder> {
  bool state = false;

  // static final initial = Tween(begin: 0.0, end: 0.0);
  // static final forward = Tween(begin: 0.0, end: pi);
  // static final reverse = Tween(begin: pi, end: 0.0);
  //
  // var tween = initial;


  //todo: replace boolean toggle to tween toggle and
  //use TweenAnimationBuilder to animate arrow rotation
  void toggle() {
    setState(() {
      state = !state;
    });
    // setState(() {
    //   if (tween == initial) {
    //     tween = forward;
    //   } else if (tween == forward) {
    //     tween = reverse;
    //   } else {
    //     tween = forward;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
        onRun: toggle,
        child: Transform.rotate(
          angle: state ? pi : 0,
          child: const Icon(
            Icons.arrow_upward_rounded,
            size: 56.0,
          ),
        )
      // child: TweenAnimationBuilder(
      //   duration: ShowcaseConfig.of(context).duration,
      //   curve: Curves.easeIn,
      //   tween: tween,
      //   builder: (BuildContext context, double value, Widget? child) {
      //     return Transform.rotate(
      //       angle: value,
      //       child: child ?? const SizedBox.shrink(),
      //     );
      //   },
      //   child: const Icon(
      //     Icons.arrow_upward_rounded,
      //     size: 56.0,
      //   ),
      // ),
    );
  }
}
