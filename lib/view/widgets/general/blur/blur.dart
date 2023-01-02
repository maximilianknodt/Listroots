import 'dart:ui';

import 'package:flutter/material.dart';

class Blur extends StatelessWidget {
  const Blur({
    Key? key,
    this.borderRadius,
    required this.sigma,
  }) : super(key: key);

  final BorderRadius? borderRadius;
  final double sigma;

  @override
  Widget build(BuildContext context) {
    final child = BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: sigma,
        sigmaY: sigma,
        tileMode: TileMode.repeated,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: borderRadius,
        ),
      ),
    );
    if (borderRadius == null) {
      return child;
    } else {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: child,
      );
    }
  }
}
