import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:listroots/logic/geo/geo_helper.dart';

import '../../data/map/polyline.dart';
import '../widgets/general/rectangle_fade_out.dart';
import '../widgets/map/static_map.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        child: RecordedTripMap(
          start: DateTime.now(),
          end: DateTime.now()..subtract(Duration(hours: 1)),
          path: [
            LatLng(52.27262175883876, 8.04809522538859),
            LatLng(52.272920574108596, 8.049362430692437),
            LatLng(52.27411581504878, 8.050543095179428),
            LatLng(52.27454321934981, 8.049671505173729),
            LatLng(52.27508787016352, 8.04886791156641),
            LatLng(52.2744902668304, 8.047260724351775),
            LatLng(52.27457726022175, 8.046852746058828),
            LatLng(52.274599954121825, 8.046413860319445),
            LatLng(52.274516743098005, 8.046389134362299),
            LatLng(52.27396452052699, 8.04510338459059),
          ],
          detections: [
            LatLng(51.5, -0.09),
            LatLng(40.7, -74.0),
          ],
        ),
      ),
    );
  }
}

class RecordedTripMap extends StatelessWidget {
  const RecordedTripMap({
    Key? key,
    required this.start,
    required this.end,
    required this.path,
    required this.detections,
  }) : super(key: key);

  final DateTime start;
  final DateTime end;
  final List<LatLng> path;
  final List<LatLng> detections;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RectangleFadeOut(
          fadeAmount: 0.1,
          child: StaticMap(
            zoom: 16,
            center: GeoHelper.getCenter(path),
            markers: detections,
            polylines: [Polyline(path)],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0), // TODO: theme extension
          child: Text(
            "27.10.2022, 17:34 Uhr\n23:03 Minuten\n3 Detektionen",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
