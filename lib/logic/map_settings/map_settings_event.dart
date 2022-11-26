part of 'map_settings_bloc.dart';

@immutable
abstract class MapSettingsEvent {
  const MapSettingsEvent();
}

class SetMapTypeEvent extends MapSettingsEvent {
  final MapType mapType;

  const SetMapTypeEvent(this.mapType);
}

class ToggleOwnDetectionsEvent extends MapSettingsEvent {
  const ToggleOwnDetectionsEvent();
}

class ToggleForeignDetectionsEvent extends MapSettingsEvent {
  const ToggleForeignDetectionsEvent();
}

class ToggleOsmSmoothnessEvent extends MapSettingsEvent {
  const ToggleOsmSmoothnessEvent();
}

class SetMapCenterEvent extends MapSettingsEvent {
  final LatLng? center;
  final bool loading;

  const SetMapCenterEvent(this.center) : loading = center == null;
}
