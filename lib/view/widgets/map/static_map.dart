import 'package:flutter/material.dart';
import 'package:listroots/view/widgets/map/layer/layer_builder.dart';
import 'package:listroots/view/widgets/map/map_base.dart';
import 'package:map/map.dart' show MapController, MapLayout;

import 'layer/color_filtered_map_tile_layer.dart';
import 'layer/marker_layer.dart';
import 'layer/polyline_layer.dart';
import 'tile_url_builder/osm_tile_url_builder.dart';

class StaticMap extends MapBase {
  const StaticMap({
    super.key,
    super.center,
    super.zoom,
    super.markers,
    super.polylines,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: MapLayout(
        controller: MapController(location: center, zoom: zoom),
        builder: (context, transformer) {
          List<LayerBuilder> layers = [
            ColorFilteredMapTileLayer(
                tileUrlBuilder: const OSMTileUrlBuilder()),
            if (polylines != null) PolylineLayer(polylines: polylines!),
            if (markers != null) MarkerLayer(markers: markers!),
          ];

          return Stack(
            children: layers.map((layer) {
              return layer.build(context, transformer);
            }).toList(),
          );
        },
      ),
    );
  }
}
