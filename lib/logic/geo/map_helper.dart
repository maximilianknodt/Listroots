import 'dart:developer';
import 'dart:math' as math;
import 'dart:ui';

import 'package:latlng/latlng.dart';

import 'geo_helper.dart';

class MapHelper {
  /// returns the distance a pixel on the map covers at a given zoom level
  ///
  /// source: https://gis.stackexchange.com/questions/7430/what-ratio-scales-do-google-maps-zoom-levels-correspond-to
  /// and: https://wiki.openstreetmap.org/wiki/Slippy_map_tilenames#Resolution_and_Scale
  static double metersPerPx(double zoomLevel, double latitude) {
    return 156543.03392 *
        math.cos(latitude * math.pi / 180) /
        math.pow(2, zoomLevel);
  }

  /// returns the zoom level for to have a width of [width] meters on the map
  /// at a given [latitude]
  static double zoomLevelForWidth(double width, double latitude) {
    return math.log(156543.03392 * math.cos(latitude * math.pi / 180) / width) /
        math.log(2);
  }

  /// returns the zoom level for to have a height of [height] meters on the map
  /// at a given [latitude]
  static double zoomLevelForHeight(double height, double latitude) {
    return math.log(156543.03392 / height) / math.log(2);
  }

  /// returns the zoom level for to contain directional extremes of [extremes]
  static double zoomLevelForExtremes(
    DirectionalExtremes<LatLng> extremes,
    Size area,
    double freeSpaceAroundEdgesFactor,
  ) {
    LatLng center = GeoHelper.computeCenterOfExtremes(extremes);
    double widthMeters = GeoHelper.distance(extremes.west, extremes.east);
    double width = widthMeters / area.width / (1 - freeSpaceAroundEdgesFactor);
    double zoomLevelWidth = zoomLevelForWidth(width, center.latitude);

    double heightMeters = GeoHelper.distance(extremes.north, extremes.south);
    double height =
        heightMeters / area.height / (1 - freeSpaceAroundEdgesFactor);
    double zoomLevelHeight = zoomLevelForHeight(height, center.latitude);
    return math.min(zoomLevelWidth, zoomLevelHeight);
  }

  static double zoomLevelForPath(
          List<LatLng> path, Size area, double freeSpaceAroundEdgesFactor) =>
      zoomLevelForExtremes(GeoHelper.getDirectionalExtremes(path), area,
          freeSpaceAroundEdgesFactor);
}
