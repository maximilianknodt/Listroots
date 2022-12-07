import '../../logic/map/settings/map_settings_bloc.dart';
import 'package:latlng/latlng.dart';

import 'map_type.dart';

class MapSettings {
  final MapType mapType;
  final bool shownOwnDetections;
  final bool shownForeignDetections;
  final bool shownOSMSmoothness;
  final LatLng? center;

  MapSettings({
    required this.mapType,
    required this.shownOwnDetections,
    required this.shownForeignDetections,
    required this.shownOSMSmoothness,
    this.center,
  });

  factory MapSettings.fromState(MapSettingsState state) {
    return MapSettings(
      mapType: state.mapType,
      shownOwnDetections: state.shownOwnDetections,
      shownForeignDetections: state.shownForeignDetections,
      shownOSMSmoothness: state.shownOSMSmoothness,
      center: state.center,
    );
  }
}
