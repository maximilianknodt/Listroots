import 'package:flutter/material.dart';

import 'blur.dart';

class BlurLayer extends StatelessWidget {
  const BlurLayer({
    super.key,
    required this.child,
    this.borderRadius,
    this.sigma,
  });

  final Widget child;
  final BorderRadius? borderRadius;
  final double? sigma;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Blur(
            borderRadius: borderRadius,
            sigma: sigma ?? 2.0,
          ),
        ),
        child,
      ],
    );
  }
}
