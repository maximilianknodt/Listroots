import 'package:latlng/latlng.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as toolkit;
part 'directional_extremes.dart';
part 'lat_lng_converter.dart';

class GeoHelper {
  /// returns the furthest point in every direction
  static DirectionalExtremes<LatLng> getDirectionalExtremes(
    List<LatLng> points,
  ) {
    LatLng north = points.reduce((value, element) {
      return value.latitude > element.latitude ? value : element;
    });
    LatLng south = points.reduce((value, element) {
      return value.latitude < element.latitude ? value : element;
    });
    LatLng east = points.reduce((value, element) {
      return value.longitude > element.longitude ? value : element;
    });
    LatLng west = points.reduce((value, element) {
      return value.longitude < element.longitude ? value : element;
    });
    return DirectionalExtremes(north, south, east, west);
  }

  /// returns the geographical center of a list of points
  static LatLng getCenter(List<LatLng> points) {
    DirectionalExtremes<LatLng> extremes = getDirectionalExtremes(points);
    // return LatLng(
    //   extremes.north.latitude + extremes.south.latitude / 2,
    //   extremes.east.longitude + extremes.west.longitude / 2,
    // );
    LatLng eastWestCenter = interpolate(extremes.east, extremes.west, .5);
    LatLng northSouthCenter = interpolate(extremes.north, extremes.south, .5);
    return interpolate(eastWestCenter, northSouthCenter, .5);
  }

  static LatLng interpolate(LatLng start, LatLng end, double fraction) {
    return _LatLngConverter.fromMapsToolkit(
      toolkit.SphericalUtil.interpolate(
        start.toMapsToolkit(),
        end.toMapsToolkit(),
        fraction,
      ),
    );
  }
}
