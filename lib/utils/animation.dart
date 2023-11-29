
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SharedAxisPageRoute extends PageRouteBuilder {
  SharedAxisPageRoute({
    required Widget page,
    required SharedAxisTransitionType transitionType,
  }) : super(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (
            BuildContext context,
            Animation primaryAnimation,
            Animation secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: transitionType,
            fillColor: Theme.of(context).colorScheme.background,
            child: child,
          ),
        );
}

class PageTransition extends StatelessWidget {
  const PageTransition(
      {super.key,
      required this.page,
      required this.isReversed,
      required this.transition});

  final Widget page;
  final bool isReversed;
  final SharedAxisTransitionType transition;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      reverse: isReversed,
      duration: const Duration(milliseconds: 1000),
      transitionBuilder: (child, animation, secondaryAnimation) =>
          SharedAxisTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: transition,
        child: child,
      ),
      child: page,
    );
  }
}
