part of 'map_settings_bloc.dart';

@immutable
abstract class MapSettingsEvent {
  const MapSettingsEvent();
}

class MapSettingsEventSetMapType extends MapSettingsEvent {
  final MapType mapType;

  const MapSettingsEventSetMapType(this.mapType);
}

class MapSettingsEventToggleOwnDetections extends MapSettingsEvent {
  const MapSettingsEventToggleOwnDetections();
}

class MapSettingsEventToggleForeignDetections extends MapSettingsEvent {
  const MapSettingsEventToggleForeignDetections();
}

class MapSettingsEventToggleOsmSmoothness extends MapSettingsEvent {
  const MapSettingsEventToggleOsmSmoothness();
}
