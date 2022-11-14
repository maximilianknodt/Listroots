import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import 'interactive_map_viewer.dart';
import 'layer/color_filtered_map_tile_layer.dart';
import 'layer/marker_layer.dart';
import 'tile_url_builder/osm_tile_url_builder.dart';

class InteractiveMap extends StatefulWidget {
  final LatLng location;
  final double zoom;
  final Function(LatLng location)? onTap;
  final List<LatLng> markers;

  const InteractiveMap({
    Key? key,
    this.location = const LatLng(52.283954, 8.0225185),
    this.zoom = 15,
    this.onTap,
    this.markers = const [],
  }) : super(key: key);

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  late final MapController controller;

  @override
  void initState() {
    controller = MapController(
      location: widget.location,
      zoom: widget.zoom,
    );
    controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveMapViewer(
      controller: controller,
      onTap: widget.onTap,
      layer: [
        ColorFilteredMapTileLayer(
          tileUrlBuilder: const OSMTileUrlBuilder(),
        ),
        MarkerLayer(
          scaleWithZoom: false,
          markers: widget.markers,
        ),
      ],
    );
  }
}
