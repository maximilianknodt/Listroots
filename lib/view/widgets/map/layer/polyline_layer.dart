import 'package:flutter/material.dart';
import 'package:map/map.dart' as map;

import '../../../../data/map/polyline.dart';
import 'layer_builder.dart';

class PolylineLayer extends LayerBuilder {
  const PolylineLayer({
    super.key,
    required this.polylines,
  });

  final List<Polyline> polylines;

  @override
  Widget build(BuildContext context, map.MapTransformer transformer) {
    return map.PolylineLayer(
      transformer: transformer,
      polylines: polylines.map((line) {
        Color color = line.color ?? Theme.of(context).colorScheme.primary;
        return map.Polyline(
          data: line.data,
          paint: Paint()
            ..strokeWidth = 4
            ..color = color,
        );
      }).toList(),
    );
  }
}
