import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:latlng/latlng.dart';
import 'package:meta/meta.dart';

import '../../../data/map/map_settings.dart';
import '../../../data/map/map_settings_repository.dart';
import '../../../data/map/map_type.dart';

part 'map_settings_event.dart';
part 'map_settings_state.dart';

class MapSettingsBloc extends Bloc<MapSettingsEvent, MapSettingsState> {
  final MapSettingsRepository _repository;

  MapSettingsBloc()
      : _repository = MapSettingsRepository(),
        super(const MapSettingsInitial()) {
    on<SetMapTypeEvent>(_setMapType);
    on<ToggleOwnDetectionsEvent>(_toggleOwnDetections);
    on<ToggleForeignDetectionsEvent>(_toggleForeignDetections);
    on<ToggleOsmSmoothnessEvent>(_toggleOsmSmoothness);
    on<SetMapCenterEvent>(_setMapCenter);

    _loadSettings();
  }

  void _setMapType(SetMapTypeEvent event, Emitter<MapSettingsState> emit) {
    emit(state.copyWith(mapType: event.mapType));
    _saveSettings();
  }

  void _toggleOwnDetections(event, Emitter<MapSettingsState> emit) {
    emit(state.copyWith(shownOwnDetections: !state.shownOwnDetections));
    _saveSettings();
  }

  void _toggleForeignDetections(event, Emitter<MapSettingsState> emit) {
    emit(state.copyWith(shownForeignDetections: !state.shownForeignDetections));
    _saveSettings();
  }

  void _toggleOsmSmoothness(event, Emitter<MapSettingsState> emit) {
    emit(state.copyWith(shownOSMSmoothness: !state.shownOSMSmoothness));
    _saveSettings();
  }

  Future<void> _saveSettings() async {
    MapSettings settings = MapSettings.fromState(state);
    await _repository.saveSettings(settings);
  }

  Future<void> _loadSettings() async {
    MapSettings settings = await _repository.loadSettings();
    emit(MapSettingsLoaded(settings));
  }

  FutureOr<void> _setMapCenter(event, Emitter<MapSettingsState> emit) {
    if (event.loading) {
      emit(state.copyWith(loadingPosition: true));
    } else {
      emit(state.copyWith(center: event.center, loadingPosition: false));
    }
  }
}
