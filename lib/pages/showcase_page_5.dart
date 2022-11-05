import 'package:flutter/material.dart';

import 'common/showcase_config.dart';
import 'common/showcase_scaffold.dart';

/// Showcase of [TweenSequence] usage
class ShowcaseTweenSequence extends StatefulWidget {
  const ShowcaseTweenSequence({
    Key? key,
  }) : super(key: key);

  @override
  _ShowcaseTweenSequenceState createState() => _ShowcaseTweenSequenceState();
}

class _ShowcaseTweenSequenceState extends State<ShowcaseTweenSequence>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  TweenSequence? sequence;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animationController = AnimationController(
        duration: ShowcaseConfig.of(context).duration, vsync: this);

    sequence = TweenSequence([
      TweenSequenceItem(
        tween: tween1,
        weight: 1,
      ),
      TweenSequenceItem(
        tween: tween2,
        weight: 2,
      ),
      TweenSequenceItem(
        tween: tween3,
        weight: 1,
      ),
      TweenSequenceItem(
        tween: tween4,
        weight: 2,
      ),
      TweenSequenceItem(
        tween: tween5,
        weight: 1,
      ),
    ])
      ..animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final tween1 = ColorTween(begin: Colors.red, end: Colors.green);
  final tween2 = ColorTween(begin: Colors.green, end: Colors.blue);
  final tween3 = ColorTween(begin: Colors.blue, end: Colors.deepPurple);
  final tween4 = ColorTween(begin: Colors.deepPurple, end: Colors.orange);
  final tween5 = ColorTween(begin: Colors.orange, end: Colors.red);

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      onRun: () => animationController.repeat(),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: ColoredBox(
              color: sequence!.evaluate(animationController),
            ),
          ),
        ),
      ),
    );
  }
}
