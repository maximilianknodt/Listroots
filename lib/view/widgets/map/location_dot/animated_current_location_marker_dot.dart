import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import 'pulsing_location_marker_dot.dart';

class AnimatedCurrentLocationMarkerDot extends StatefulWidget {
  const AnimatedCurrentLocationMarkerDot({
    Key? key,
    required this.latlng,
    required this.transformer,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  final LatLng latlng;
  final MapTransformer transformer;
  final Color? color;
  final Color? backgroundColor;

  @override
  State<AnimatedCurrentLocationMarkerDot> createState() =>
      _AnimatedCurrentLocationMarkerDotState();
}

class _AnimatedCurrentLocationMarkerDotState
    extends State<AnimatedCurrentLocationMarkerDot> {
  final pulsingMarkerKey = GlobalKey();
  double get _dotSize => 20; //size - _animation.value * size * edgePercentage;
  Offset offset = Offset.zero;
  LatLng oldLatLng = LatLng(0, 0);

  @override
  Widget build(BuildContext context) {
    offset = widget.transformer.toOffset(widget.latlng);
    bool needsAnimation = oldLatLng.latitude != widget.latlng.latitude;
    needsAnimation |= oldLatLng.longitude != widget.latlng.longitude;
    if (needsAnimation) {
      oldLatLng = widget.latlng;
    }

    return AnimatedPositioned(
      duration: Duration(milliseconds: needsAnimation ? 1000 : 0),
      left: offset.dx - _dotSize / 2,
      top: offset.dy - _dotSize / 2,
      width: _dotSize,
      height: _dotSize,
      child: PulsingLocationMarkerDot(
        key: pulsingMarkerKey,
        color: widget.color,
        backgroundColor: widget.backgroundColor,
      ),
    );
  }
}
