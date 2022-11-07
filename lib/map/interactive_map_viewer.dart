import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class InteractiveMapViewer extends StatefulWidget {
  final Widget child;
  final MapController controller;
  final Function(LatLng location)? onTap;

  const InteractiveMapViewer({
    super.key,
    required this.child,
    required this.controller,
    this.onTap,
  });

  @override
  State<InteractiveMapViewer> createState() => _InteractiveMapViewerState();
}

class _InteractiveMapViewerState extends State<InteractiveMapViewer> {
  Offset? _dragStart;
  double _scaleStart = 1.0;
  late MapTransformer _transformer;

  @override
  Widget build(BuildContext context) {
    return MapLayout(
      controller: widget.controller,
      builder: (context, transformer) {
        _transformer = transformer;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTapDown: _onDoubleTapDown,
          onScaleStart: _onScaleStart,
          onScaleUpdate: _onScaleUpdate,
          onTapUp: _onTapUp,
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerSignal: _onPointerSignal,
            child: widget.child,
          ),
        );
      },
    );
  }

  void _onDoubleTapDown(TapDownDetails details) {
    const delta = 0.5;
    final zoom = clampDouble(widget.controller.zoom + delta, 2, 18);
    final position = details.localPosition;
    _transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      setState(() => widget.controller.zoom += 0.02);
    } else if (scaleDiff < 0) {
      setState(() => widget.controller.zoom -= 0.02);
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      setState(() {
        _dragStart = now;
        _transformer.drag(diff.dx, diff.dy);
      });
    }
  }

  void _onTapUp(TapUpDetails details) {
    LatLng location = _transformer.toLatLng(details.localPosition);
    widget.onTap?.call(location);
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      final delta = event.scrollDelta.dy / -1000.0;
      final zoom = clampDouble(widget.controller.zoom + delta, 2, 18);
      setState(() {
        _transformer.setZoomInPlace(zoom, event.localPosition);
      });
    }
  }
}
