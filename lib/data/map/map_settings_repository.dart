import 'package:shared_preferences/shared_preferences.dart';

import 'map_settings.dart';
import 'map_type.dart';

/// saves and loads the map settings from the shared preferences
class MapSettingsRepository {
  SharedPreferences? prefs;

  MapSettingsRepository() {
    _init();
  }

  Future<void> _init() async {
    prefs = null;
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveSettings(MapSettings settings) async {
    if (prefs == null) {
      await _init();
    }
    assert(prefs != null);
    await prefs!.setString("mapType", settings.mapType.toString());
    await prefs!.setBool("shownOwnDetections", settings.shownOwnDetections);
    await prefs!
        .setBool("shownForeignDetections", settings.shownForeignDetections);
    await prefs!.setBool("shownOSMSmoothness", settings.shownOSMSmoothness);
  }

  Future<MapSettings> loadSettings() async {
    if (prefs == null) {
      await _init();
    }
    assert(prefs != null);
    final mapType = prefs!.getString("mapType");
    final shownOwnDetections = prefs!.getBool("shownOwnDetections");
    final shownForeignDetections = prefs!.getBool("shownForeignDetections");
    final shownOSMSmoothness = prefs!.getBool("shownOSMSmoothness");

    return MapSettings(
      mapType: mapType != null
          ? MapType.values.firstWhere((e) => e.toString() == mapType)
          : MapType.osmThemed,
      shownOwnDetections: shownOwnDetections ?? true,
      shownForeignDetections: shownForeignDetections ?? true,
      shownOSMSmoothness: shownOSMSmoothness ?? true,
    );
  }
}
