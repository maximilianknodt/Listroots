import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart' as map;

import 'layer_builder.dart';

class PolylineLayer extends LayerBuilder {
  const PolylineLayer({
    super.key,
    required this.polylines,
  });

  final List<List<LatLng>> polylines;

  @override
  Widget build(BuildContext context, map.MapTransformer transformer) {
    Color color = Theme.of(context).colorScheme.primary;
    return map.PolylineLayer(
      transformer: transformer,
      polylines: polylines.map((e) {
        return map.Polyline(
          data: e,
          paint: Paint()
            ..strokeWidth = 4
            ..color = color,
        );
      }).toList(),
    );
  }
}
