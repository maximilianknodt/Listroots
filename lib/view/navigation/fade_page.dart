import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// A [Page] that fades in its child.
class FadePage extends CustomTransitionPage {
  FadePage({required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder: (context, animation, _, child) {
            log("build FadePage: ${animation.value}");
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
