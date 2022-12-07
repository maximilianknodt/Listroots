import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlng/latlng.dart';

import '../../data/map/polyline.dart';
import '../../logic/auth/auth_bloc.dart';
import '../../logic/map/messaging/map_messaging_bloc.dart';
import '../../logic/map/settings/map_settings_bloc.dart';
import '../widgets/map/interactive_map.dart';
import '../../logic/geo/gps/gps_bloc.dart';
import 'buttons/focus_gps_pos_fab.dart';
import 'buttons/tune_fab.dart';
import 'map_page_map.dart';
import 'message_banners/message_banner_list.dart';
import 'settings/settings_sheet.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MapSettingsBloc()),
        BlocProvider(create: (context) {
          final authBloc = context.read<AuthBloc>();
          return MapMessagingBloc(authBloc: authBloc);
        }),
        BlocProvider(create: (context) => GpsBloc()..add(InitGpsStream())),
      ],
      child: const _MapPage(),
    );
  }
}

class _MapPage extends StatefulWidget {
  const _MapPage();

  final double _maxSize = 0.475;
  final double _minSize = 0.05;
  final double _baseOffset = 20;

  @override
  State<_MapPage> createState() => _MapState();
}

class _MapState extends State<_MapPage> {
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
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30), // TODO: theme extension
          ),
          child: BlocBuilder<MapSettingsBloc, MapSettingsState>(
            builder: (context, state) {
              return InteractiveMap(
                onTap: (pos) => _mapTap(context, pos),
                mapType: state.mapType,
                center: const LatLng(
                    52.283954, 8.0225185), // TODO: real data & state management
                markers: const [
                  LatLng(52.29, 8.023), // TODO: real data & state management
                ],
                polylines: state.shownOSMSmoothness
                    ? const [
                        Polyline([
                          // TODO: real data & state management
                          LatLng(52.283954, 8.0225185),
                          LatLng(52.2839, 8.02251),
                          LatLng(52.29, 8.023),
                          LatLng(52.29, 8.026),
                          LatLng(52.2889, 8.032),
                        ]),
                        Polyline.colored([
                          // TODO: real data & state management
                          LatLng(52.2832954, 8.0225185),
                          LatLng(52.2832954, 8.0295185),
                          LatLng(52.2802954, 8.0235185),
                          LatLng(52.2812954, 8.0233185),
                          LatLng(52.2812000, 8.0223185),
                        ], color: Colors.amber),
                      ]
                    : [],
              );
            },
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FocusGpsPosFAB(isOpen: _isExpanded),
              SizedBox(height: 10),
              TuneFAB(
                isOpen: _isExpanded,
                onPressed: _onPressedFAB,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _mapTap(BuildContext context, LatLng location) {
    if (_isExpanded) {
      _onPressedFAB();
    }
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
