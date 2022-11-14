import 'dart:math' as math;

class MapHelper {
  /// returns the distance a pixel on the map covers at a given zoom level#
  ///
  /// source: https://gis.stackexchange.com/questions/7430/what-ratio-scales-do-google-maps-zoom-levels-correspond-to
  /// and: https://wiki.openstreetmap.org/wiki/Slippy_map_tilenames#Resolution_and_Scale
  static double metersPerPx(double zoomLevel, double latitude) {
    return 156543.03392 *
        math.cos(latitude * math.pi / 180) /
        math.pow(2, zoomLevel);
  }
}
