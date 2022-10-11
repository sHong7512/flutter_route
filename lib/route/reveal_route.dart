import 'package:flutter/material.dart';
import 'package:route/environment.dart';

import 'circular_reveal_clipper.dart';

class RevealRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Alignment centerAlignment;
  final Offset centerOffset;
  final double minRadius;
  final double maxRadius;
  final Duration duration;
  final Duration durationReverse;

  @override
  Duration get transitionDuration => duration;

  @override
  Duration get reverseTransitionDuration => durationReverse;

  RevealRoute({
    required this.page,
    this.minRadius = 0,
    required this.maxRadius,
    required this.centerAlignment,
    this.centerOffset = const Offset(0, 0),
    this.duration = MAIN_DURATION,
    this.durationReverse = MAIN_REVERSE_DURATION,
  })  : assert(centerOffset != null || centerAlignment != null),
        super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ClipPath(
      clipper: CircularRevealClipper(
        fraction: animation.value,
        centerAlignment: centerAlignment,
        centerOffset: centerOffset,
        minRadius: minRadius,
        maxRadius: maxRadius,
      ),
      child: child,
    );
  }
}
