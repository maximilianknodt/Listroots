import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import 'map_tile_layer.dart';
import 'tile_url_builder/osm_tile_url_builder.dart';

class InteractiveMap extends StatefulWidget {
  final LatLng location;
  final double zoom;
  final Function(LatLng location)? onTap;

  const InteractiveMap({
    Key? key,
    this.location = const LatLng(52.283954, 8.0225185),
    this.zoom = 15,
    this.onTap,
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
    super.initState();
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clampDouble(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MapLayout(
      controller: controller,
      builder: (context, transformer) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTapDown: (details) =>
              _onDoubleTap(transformer, details.localPosition),
          onScaleStart: _onScaleStart,
          onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
          onTapUp: (details) {
            LatLng location = transformer.toLatLng(details.localPosition);
            widget.onTap?.call(location);
          },
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                final delta = event.scrollDelta.dy / -1000.0;
                final zoom = clampDouble(controller.zoom + delta, 2, 18);

                transformer.setZoomInPlace(zoom, event.localPosition);
                setState(() {});
              }
            },
            child: Stack(
              children: const [
                MapTileLayer(
                  tileUrlBuilder: OSMTileUrlBuilder(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
