import 'package:flutter/material.dart';

import 'linear_fade_gradient.dart';

/// A widget that fades out the every side of its child.
class RectangleFadeOut extends StatelessWidget {
  const RectangleFadeOut({
    Key? key,
    required this.child,
    this.aspectRatio = 1.0,
    this.fadeAmount = 0.1,
  }) : super(key: key);

  final Widget child;
  final double fadeAmount;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearFadeGradient(
          Axis.horizontal,
          fadeAmount: fadeAmount * aspectRatio,
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return LinearFadeGradient(
            Axis.vertical,
            fadeAmount: fadeAmount,
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: child,
      ),
    );
  }
}
