import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';

import '../widgets/map/interactive_map.dart';
import 'message_banner_list.dart';
import 'settings_sheet.dart';
import 'tune_fab.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  final double _maxSize = 0.35;
  final double _minSize = 0.05;
  final double _baseOffset = 20;

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  final Duration _animationDuration = const Duration(milliseconds: 300);

  double _bottom = 57;
  bool _isExpanded = false;
  late final double _threshold;

  @override
  void initState() {
    _threshold = (widget._maxSize - widget._minSize) / 2;
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30), // TODO: theme extension
          ),
          child: InteractiveMap(
            markers: [
              LatLng(52.283954, 8.0225185),
            ],
            polylines: [
              const [
                LatLng(52.283954, 8.0225185),
                LatLng(52.2839, 8.02251),
                LatLng(52.29, 8.023),
                LatLng(52.29, 8.026),
                LatLng(52.2889, 8.032),
              ]
            ],
          ),
        ),
        const MessageBannerList(),
        SettingsSheet(
          controller: _controller,
          maxSize: widget._maxSize,
          minSize: widget._minSize,
        ),
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: _animationDuration,
          padding: EdgeInsets.only(bottom: _bottom, right: widget._baseOffset),
          child: TuneFAB(
            isOpen: _isExpanded,
            onPressed: _onPressedFAB,
          ),
        ),
      ],
    );
  }

  void _onPressedFAB() async {
    _controller.removeListener(_listener);
    double target = _isExpanded ? widget._minSize : widget._maxSize;
    setState(() {
      _isExpanded = !_isExpanded;
      _bottom = _controller.sizeToPixels(target) + widget._baseOffset;
    });
    await _controller.animateTo(
      !_isExpanded ? widget._minSize : widget._maxSize,
      duration: _animationDuration,
      curve: Curves.easeInOut,
    );
    _controller.addListener(_listener);
  }

  void _listener() {
    double size = _controller.pixelsToSize(_controller.pixels);
    _isExpanded = size > _threshold;
    setState(() => _bottom = widget._baseOffset + _controller.pixels);
  }
}
