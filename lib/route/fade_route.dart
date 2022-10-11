import 'package:flutter/material.dart';
import 'package:route/environment.dart';

class FadeRoute<T> extends PageRoute<T> {
  final Duration duration;
  final Widget child;
  final Color? barrierColorCustom;
  final bool opaqueCustom;

  FadeRoute({
    required this.child,
    this.duration = MAIN_DURATION,
    this.barrierColorCustom,
    this.opaqueCustom = true,
  });

  @override
  bool get opaque => opaqueCustom;

  @override
  Color get barrierColor => barrierColorCustom ?? Colors.white.withOpacity(0.7);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => duration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
