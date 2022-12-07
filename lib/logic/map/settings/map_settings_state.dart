part of 'map_settings_bloc.dart';

@immutable
class MapSettingsState {
  final MapType mapType;
  final bool shownOwnDetections;
  final bool shownForeignDetections;
  final bool shownOSMSmoothness;
  final LatLng? center;
  final bool loadingPosition;

  const MapSettingsState({
    required this.mapType,
    required this.shownOwnDetections,
    required this.shownForeignDetections,
    required this.shownOSMSmoothness,
    this.center,
    this.loadingPosition = false,
  });

  MapSettingsState copyWith({
    MapType? mapType,
    bool? shownOwnDetections,
    bool? shownForeignDetections,
    bool? shownOSMSmoothness,
    LatLng? center,
    bool? loadingPosition,
  }) {
    return MapSettingsState(
      mapType: mapType ?? this.mapType,
      shownOwnDetections: shownOwnDetections ?? this.shownOwnDetections,
      shownForeignDetections:
          shownForeignDetections ?? this.shownForeignDetections,
      shownOSMSmoothness: shownOSMSmoothness ?? this.shownOSMSmoothness,
      center: center ?? this.center,
      loadingPosition: loadingPosition ?? this.loadingPosition,
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
          center: const LatLng(0, 0),
          loadingPosition: false,
        );
}

class MapSettingsLoaded extends MapSettingsState {
  MapSettingsLoaded(MapSettings settings)
      : super(
          mapType: settings.mapType,
          shownOwnDetections: settings.shownOwnDetections,
          shownForeignDetections: settings.shownForeignDetections,
          shownOSMSmoothness: settings.shownOSMSmoothness,
          center: settings.center,
        );
}
