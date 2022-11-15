import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';

import '../../../data/map/polyline.dart';

abstract class MapBase extends StatelessWidget {
  const MapBase({
    super.key,
    this.center = const LatLng(52.283954, 8.0225185),
    this.zoom = 15,
    this.markers,
    this.polylines,
  });

  final LatLng center;
  final double zoom;
  final List<LatLng>? markers;
  final List<Polyline>? polylines;
}
