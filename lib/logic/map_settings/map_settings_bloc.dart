import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/map/map_settings.dart';
import '../../data/map/map_settings_repository.dart';
import '../../data/map/map_type.dart';

part 'map_settings_event.dart';
part 'map_settings_state.dart';

class MapSettingsBloc extends Bloc<MapSettingsEvent, MapSettingsState> {
  final MapSettingsRepository _repository;

  MapSettingsBloc()
      : _repository = MapSettingsRepository(),
        super(const MapSettingsInitial()) {
    on<MapSettingsEventSetMapType>(_setMapType);
    on<MapSettingsEventToggleOwnDetections>(_toggleOwnDetections);
    on<MapSettingsEventToggleForeignDetections>(_toggleForeignDetections);
    on<MapSettingsEventToggleOsmSmoothness>(_toggleOsmSmoothness);

    _loadSettings();
  }

  void _setMapType(
      MapSettingsEventSetMapType event, Emitter<MapSettingsState> emit) {
    _saveSettings();
    emit(state.copyWith(mapType: event.mapType));
  }

  void _toggleOwnDetections(event, Emitter<MapSettingsState> emit) {
    _saveSettings();
    emit(state.copyWith(shownOwnDetections: !state.shownOwnDetections));
  }

  void _toggleForeignDetections(event, Emitter<MapSettingsState> emit) {
    _saveSettings();
    emit(state.copyWith(shownForeignDetections: !state.shownForeignDetections));
  }

  void _toggleOsmSmoothness(event, Emitter<MapSettingsState> emit) {
    _saveSettings();
    emit(state.copyWith(shownOSMSmoothness: !state.shownOSMSmoothness));
  }

  Future<void> _saveSettings() async {
    MapSettings settings = MapSettings.fromState(state);
    await _repository.saveSettings(settings);
  }

  Future<void> _loadSettings() async {
    MapSettings settings = await _repository.loadSettings();
    emit(MapSettingsLoaded(settings));
  }
}
