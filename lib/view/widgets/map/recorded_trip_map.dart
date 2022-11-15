import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';

import '../../../data/map/polyline.dart';
import '../general/rectangle_fade_out.dart';
import 'static_map.dart';

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
        LayoutBuilder(
          builder: (context, constraints) {
            double aspectRatio = constraints.maxWidth / constraints.maxHeight;
            Size area = constraints.biggest;
            return RectangleFadeOut(
              fadeAmount: 0.1,
              aspectRatio: aspectRatio,
              child: StaticMap(
                mapArea: area,
                markers: detections,
                polylines: [Polyline(path)],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0), // TODO: theme extension
          child: Text(
            "27.10.2022, 17:34 Uhr\n23:03 Minuten\n3 Detektionen", // TODO: trip details & i18n
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
