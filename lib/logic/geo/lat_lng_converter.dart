part of 'geo_helper.dart';

extension _LatLngConverter on LatLng {
  static LatLng fromMapsToolkit(toolkit.LatLng latLng) {
    return LatLng(latLng.latitude, latLng.longitude);
  }

  toolkit.LatLng toMapsToolkit() {
    return toolkit.LatLng(latitude, longitude);
  }
}
