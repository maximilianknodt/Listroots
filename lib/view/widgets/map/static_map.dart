import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'layer/layer_builder.dart';
import 'map_base.dart';
import 'package:map/map.dart' show MapController, MapLayout;

import '../../../data/map/polyline.dart';
import '../../../logic/geo/geo_helper.dart';
import '../../../logic/geo/map_helper.dart';
import 'layer/color_filtered_map_tile_layer.dart';
import 'layer/marker_layer.dart';
import 'layer/polyline_layer.dart';
import 'tile_url_builder/osm_tile_url_builder.dart';

class StaticMap extends MapBase {
  const StaticMap._({
    super.key,
    super.center,
    super.zoom,
    super.markers,
    super.polylines,
  });

  factory StaticMap({
    Key? key,
    LatLng? center,
    double? zoom,
    List<LatLng>? markers,
    List<Polyline>? polylines,
    Size? mapArea,
  }) {
    if (center == null || zoom == null) {
      List<LatLng> points = [];
      points.addAll(markers ?? []);
      points.addAll(polylines?.expand((element) => element.data) ?? []);

      if (points.isNotEmpty) {
        center = center ?? GeoHelper.computeCenter(points);
        if (zoom == null && mapArea != null) {
          zoom = MapHelper.zoomLevelForPath(points, mapArea, 0.35);
        }
      }
    }

    return StaticMap._(
      key: key,
      center: center ?? const LatLng(52.283954, 8.0225185),
      zoom: zoom ?? 15,
      markers: markers,
      polylines: polylines,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: MapLayout(
        controller: MapController(location: center, zoom: zoom),
        builder: (context, transformer) {
          List<LayerBuilder> layers = [
            ColorFilteredMapTileLayer(
              tileUrlBuilder: const OSMTileUrlBuilder(),
            ),
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
