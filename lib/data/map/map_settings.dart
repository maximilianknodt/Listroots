import '../../logic/map_settings/map_settings_bloc.dart';
import 'map_type.dart';

class MapSettings {
  final MapType mapType;
  final bool shownOwnDetections;
  final bool shownForeignDetections;
  final bool shownOSMSmoothness;

  MapSettings({
    required this.mapType,
    required this.shownOwnDetections,
    required this.shownForeignDetections,
    required this.shownOSMSmoothness,
  });

  factory MapSettings.fromState(MapSettingsState state) {
    return MapSettings(
      mapType: state.mapType,
      shownOwnDetections: state.shownOwnDetections,
      shownForeignDetections: state.shownForeignDetections,
      shownOSMSmoothness: state.shownOSMSmoothness,
    );
  }
}
