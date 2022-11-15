import 'tile_url_builder.dart';

class CycleOSMTileUrlBuilder extends TileUrlBuilder {
  const CycleOSMTileUrlBuilder() : super();

  @override
  String call(int x, int y, int z) {
    final url = 'https://a.tile-cyclosm.openstreetmap.fr/cyclosm/$z/$x/$y.png';
    return url;
  }
}
