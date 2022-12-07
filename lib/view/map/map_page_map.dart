import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlng/latlng.dart';

import '../../data/map/polyline.dart';
import '../../logic/map_settings/map_settings_bloc.dart';
import '../widgets/map/interactive_map.dart';

class MapPageMap extends StatelessWidget {
  const MapPageMap({super.key, this.onMapTap});

  final Function(LatLng)? onMapTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapSettingsBloc, MapSettingsState>(
      builder: (context, state) {
        final String centerString = state.center == null
            ? 'null'
            : '${state.center!.latitude}, ${state.center!.longitude}';
        return InteractiveMap(
          key: Key(centerString),
          center: state.center,
          onTap: onMapTap,
          mapType: state.mapType,
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
    );
  }
}
