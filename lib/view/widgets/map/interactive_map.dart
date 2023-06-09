import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart' show MapController;

import '../../../data/map/map_type.dart';
import '../../../data/map/polyline.dart';
import 'interactive_map_viewer.dart';
import 'layer/color_filtered_map_tile_layer.dart';
import 'layer/gps_location_layer.dart';
import 'layer/map_tile_layer.dart';
import 'layer/marker_layer.dart';
import 'layer/polyline_layer.dart';
import 'map_base.dart';

class InteractiveMap extends MapBase {
  const InteractiveMap({
    super.key,
    super.center,
    super.zoom,
    this.onTap,
    super.markers,
    super.polylines,
    this.mapType = MapType.osmThemed,
  });

  final Function(LatLng location)? onTap;
  final MapType mapType;

  @override
  Widget build(BuildContext context) {
    return _InteractiveMapDyn(
      key: key,
      center: center,
      zoom: zoom,
      onTap: onTap,
      markers: markers ?? [],
      polylines: polylines ?? [],
      mapType: mapType,
    );
  }
}

class _InteractiveMapDyn extends StatefulWidget {
  final LatLng center;
  final double zoom;
  final Function(LatLng location)? onTap;
  final List<LatLng> markers;
  final List<Polyline> polylines;
  final MapType mapType;

  const _InteractiveMapDyn({
    Key? key,
    this.center = const LatLng(52.283954, 8.0225185),
    this.zoom = 15,
    this.onTap,
    this.markers = const [],
    this.polylines = const [],
    this.mapType = MapType.osmThemed,
  }) : super(key: key);

  @override
  State<_InteractiveMapDyn> createState() {
    return _InteractiveMapDynState();
  }
}

class _InteractiveMapDynState extends State<_InteractiveMapDyn> {
  late final MapController controller;

  @override
  void initState() {
    controller = MapController(
      location: widget.center,
      zoom: widget.zoom,
    );
    log('MapController initialized');
    controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveMapViewer(
      controller: controller,
      onTap: widget.onTap,
      layer: [
        _mapTileLayer,
        PolylineLayer(
          polylines: widget.polylines,
        ),
        MarkerLayer(
          scaleWithZoom: false,
          markers: widget.markers,
          backgroundColor: widget.mapType.backgroundColor,
        ),
        GpsLocationLayer(
          backgroundColor: widget.mapType.backgroundColor,
        ),
      ],
    );
  }

  MapTileLayer get _mapTileLayer {
    if (widget.mapType.isColorFiltered) {
      return ColorFilteredMapTileLayer(
        tileUrlBuilder: widget.mapType.tileUrlBuilder,
      );
    } else {
      return MapTileLayer(
        tileUrlBuilder: widget.mapType.tileUrlBuilder,
      );
    }
  }
}
