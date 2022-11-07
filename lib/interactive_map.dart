import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';

class InteractiveMap extends StatefulWidget {
  const InteractiveMap({Key? key}) : super(key: key);

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  final MapController controller = MapController(
    location: const LatLng(52.283954, 8.0225185),
    zoom: 15,
  );

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
            final location = transformer.toLatLng(details.localPosition);

            //final clicked = transformer.fromLatLngToXYCoords(location);
            //print('${location.longitude}, ${location.latitude}');
            //print('${clicked.dx}, ${clicked.dy}');
            //print('${details.localPosition.dx}, ${details.localPosition.dy}');

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                    'You have clicked on (${location.longitude}, ${location.latitude}).'),
              ),
            );
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
              children: [
                MapTileLayer(
                  tileUrlBuilder: (x, y, z) {
                    return 'https://a.tile.openstreetmap.org/$z/$x/$y.png';
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MapTileLayer extends StatelessWidget {
  const MapTileLayer({
    Key? key,
    required this.tileUrlBuilder,
  }) : super(key: key);

  final String Function(int, int, int) tileUrlBuilder;

  @override
  Widget build(BuildContext context) {
    return TileLayer(
      builder: (context, x, y, z) {
        final tilesInZoom = pow(2.0, z).floor();

        while (x < 0) {
          x += tilesInZoom;
        }
        while (y < 0) {
          y += tilesInZoom;
        }

        x %= tilesInZoom;
        y %= tilesInZoom;

        return CachedNetworkImage(
          imageUrl: tileUrlBuilder(x, y, z),
          fit: BoxFit.cover,
        );
      },
    );
  }
}
