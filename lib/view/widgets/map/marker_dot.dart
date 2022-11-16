import 'package:flutter/material.dart';

class MarkerDot extends StatelessWidget {
  const MarkerDot({
    super.key,
    required this.position,
    this.color,
    this.backgroundColor,
    this.size = 10,
  });

  final Offset position;
  final double size;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx - size / 2,
      top: position.dy - size / 2,
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: backgroundColor ??
                Theme.of(context).colorScheme.primaryContainer,
            strokeAlign: StrokeAlign.outside,
          ),
        ),
      ),
    );
  }
}
