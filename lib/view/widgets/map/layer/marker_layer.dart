import 'dart:math';

import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import '../marker_dot.dart';
import 'layer_builder.dart';

class MarkerLayer extends LayerBuilder {
  const MarkerLayer({
    super.key,
    required this.markers,
    this.scaleWithZoom = false,
    this.markerScale,
    this.color,
    this.backgroundColor,
  }) : assert((markerScale == null && scaleWithZoom == false) ||
            (markerScale != null && scaleWithZoom == true));

  final List<LatLng> markers;
  final bool scaleWithZoom;
  final double? markerScale;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, MapTransformer transformer) {
    final markerPositions = markers.map(transformer.toOffset).toList();
    final double size = markerScale ??
        (scaleWithZoom ? 0.001 * pow(transformer.controller.zoom, 4) : 10.0);
    return Stack(
      children: markerPositions.map((element) {
        return MarkerDot(
          position: element,
          size: size,
          color: color,
          backgroundColor: backgroundColor,
        );
      }).toList(),
    );
  }
}
