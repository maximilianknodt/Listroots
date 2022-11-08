import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class FadePage extends CustomTransitionPage {
  FadePage({required super.child})
      : super(
          transitionsBuilder: (context, animation, _, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
