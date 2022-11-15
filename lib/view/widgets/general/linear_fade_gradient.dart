import 'package:flutter/material.dart';

/// Specialized [LinearGradient] that fades out the edges of the gradient to black.
class LinearFadeGradient extends LinearGradient {
  LinearFadeGradient(Axis direction, {double fadeAmount = 0.1})
      : super(
          begin: direction == Axis.horizontal
              ? Alignment.topCenter
              : Alignment.centerLeft,
          end: direction == Axis.horizontal
              ? Alignment.bottomCenter
              : Alignment.centerRight,
          colors: [
            Colors.black,
            Colors.transparent,
            Colors.transparent,
            Colors.black
          ],
          stops: [0.0, fadeAmount, 1.0 - fadeAmount, 1.0],
        );
}
