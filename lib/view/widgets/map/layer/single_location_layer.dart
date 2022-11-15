import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import 'layer_builder.dart';

class SingleLocationLayer extends LayerBuilder {
  const SingleLocationLayer({
    required this.location,
    required this.builder,
  });

  final LatLng location;
  final Widget Function(BuildContext context, Offset offset) builder;

  @override
  Widget build(BuildContext context, MapTransformer transformer) {
    Offset offset = transformer.toOffset(location);
    return builder(context, offset);
  }
}
