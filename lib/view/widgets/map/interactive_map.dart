import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:listroots/view/widgets/map/map_base.dart';
import 'package:map/map.dart' show MapController;

import '../../../data/map/polyline.dart';
import 'current_location_marker_dot.dart';
import 'interactive_map_viewer.dart';
import 'layer/color_filtered_map_tile_layer.dart';
import 'layer/marker_layer.dart';
import 'layer/polyline_layer.dart';
import 'layer/single_location_layer.dart';
import 'tile_url_builder/osm_tile_url_builder.dart';

class InteractiveMap extends MapBase {
  const InteractiveMap({
    super.key,
    LatLng? location,
    super.zoom,
    this.onTap,
    super.markers,
    super.polylines,
  }) : super(center: location ?? const LatLng(52.283954, 8.0225185));

  final Function(LatLng location)? onTap;

  @override
  Widget build(BuildContext context) {
    return _InteractiveMapDyn(
      key: key,
      location: center,
      zoom: zoom,
      onTap: onTap,
      markers: markers ?? [],
      polylines: polylines ?? [],
    );
  }
}

class _InteractiveMapDyn extends StatefulWidget {
  final LatLng location;
  final double zoom;
  final Function(LatLng location)? onTap;
  final List<LatLng> markers;
  final List<Polyline> polylines;

  const _InteractiveMapDyn({
    Key? key,
    this.location = const LatLng(52.283954, 8.0225185),
    this.zoom = 15,
    this.onTap,
    this.markers = const [],
    this.polylines = const [],
  }) : super(key: key);

  @override
  State<_InteractiveMapDyn> createState() => _InteractiveMapDynState();
}

class _InteractiveMapDynState extends State<_InteractiveMapDyn> {
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
        PolylineLayer(
          polylines: widget.polylines,
        ),
        MarkerLayer(
          scaleWithZoom: false,
          markers: widget.markers,
        ),
        SingleLocationLayer(
          location: widget.location,
          builder: (_, offset) => CurrentLocationMarkerDot(offset: offset),
        ),
      ],
    );
  }
}
