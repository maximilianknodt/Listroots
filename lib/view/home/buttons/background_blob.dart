import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class BackgroundBlob extends StatelessWidget {
  const BackgroundBlob({
    Key? key,
    required this.size,
    this.right,
    this.left,
    this.top,
    this.bottom,
    this.smooth,
    this.id,
  }) : super(key: key);

  final double size;
  final double? right;
  final double? left;
  final double? top;
  final double? bottom;
  final double? smooth;
  final String? id;

  @override
  Widget build(BuildContext context) {
    double endRadius = 0.7;
    if (smooth != null) {
      endRadius = smooth!;
    }

    return Positioned.fill(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Blob.fromID(
        id: [id ?? '5-6-49324'],
        size: size,
        styles: BlobStyles(
          gradient: RadialGradient(
            colors: [
              Colors.white.withOpacity(0.6),
              Theme.of(context).colorScheme.primary.withOpacity(0),
            ],
            stops: [0, endRadius],
          ).createShader(Rect.fromLTRB(0, 0, size, size)),
        ),
      ),
    );
  }
}
