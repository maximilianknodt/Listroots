part of 'map_settings_bloc.dart';

@immutable
class MapSettingsState {
  final MapType mapType;
  final bool shownOwnDetections;
  final bool shownForeignDetections;
  final bool shownOSMSmoothness;

  const MapSettingsState({
    required this.mapType,
    required this.shownOwnDetections,
    required this.shownForeignDetections,
    required this.shownOSMSmoothness,
  });

  MapSettingsState copyWith({
    MapType? mapType,
    bool? shownOwnDetections,
    bool? shownForeignDetections,
    bool? shownOSMSmoothness,
  }) {
    return MapSettingsState(
      mapType: mapType ?? this.mapType,
      shownOwnDetections: shownOwnDetections ?? this.shownOwnDetections,
      shownForeignDetections:
          shownForeignDetections ?? this.shownForeignDetections,
      shownOSMSmoothness: shownOSMSmoothness ?? this.shownOSMSmoothness,
    );
  }
}

class MapSettingsInitial extends MapSettingsState {
  const MapSettingsInitial()
      : super(
          mapType: MapType.osmThemed,
          shownOwnDetections: true,
          shownForeignDetections: true,
          shownOSMSmoothness: true,
        );
}

class MapSettingsLoaded extends MapSettingsState {
  MapSettingsLoaded(MapSettings settings)
      : super(
          mapType: settings.mapType,
          shownOwnDetections: settings.shownOwnDetections,
          shownForeignDetections: settings.shownForeignDetections,
          shownOSMSmoothness: settings.shownOSMSmoothness,
        );
}
