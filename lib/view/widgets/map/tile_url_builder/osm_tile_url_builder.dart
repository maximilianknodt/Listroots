import 'tile_url_builder.dart';

class OSMTileUrlBuilder extends TileUrlBuilder {
  const OSMTileUrlBuilder() : super();

  @override
  String call(int x, int y, int z) {
    final url = 'https://tile.openstreetmap.org/$z/$x/$y.png';
    return url; // TODO: OSM dark mode theme
  }
}
