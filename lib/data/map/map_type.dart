import 'package:flutter/material.dart';

import '../../view/widgets/map/tile_url_builder/cycle_osm_tile_url_builder.dart';
import '../../view/widgets/map/tile_url_builder/osm_tile_url_builder.dart';
import '../../view/widgets/map/tile_url_builder/tile_url_builder.dart';

enum MapType {
  osmThemed,
  osmOriginal,
  cycleOSMOriginal;

  String get title => const {
        // TODO: i18n
        MapType.osmThemed: "listroots OSM",
        MapType.osmOriginal: "Original OSM",
        MapType.cycleOSMOriginal: "CycleOSM",
      }[this]!;

  IconData get icon => const {
        MapType.osmThemed: Icons.color_lens_outlined,
        MapType.osmOriginal: Icons.map_outlined,
        MapType.cycleOSMOriginal: Icons.directions_bike_outlined,
      }[this]!;

  TileUrlBuilder get tileUrlBuilder => const {
        MapType.osmThemed: OSMTileUrlBuilder(),
        MapType.osmOriginal: OSMTileUrlBuilder(),
        MapType.cycleOSMOriginal: CycleOSMTileUrlBuilder(),
      }[this]!;

  bool get isColorFiltered => const {
        MapType.osmThemed: true,
        MapType.osmOriginal: false,
        MapType.cycleOSMOriginal: false,
      }[this]!;
}
