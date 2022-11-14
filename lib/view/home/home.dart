import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';

import '../../data/map/polyline.dart';
import '../widgets/general/rectangle_fade_out.dart';
import '../widgets/map/static_map.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 300,
        child: RectangleFadeOut(
          fadeAmount: 0.1,
          child: StaticMap(
            zoom: 12,
            center: LatLng(52.261372, 8.0225185),
            markers: [
              LatLng(52.236372, 8.0225185),
              LatLng(52.283954, 8.0225185),
            ],
            polylines: [
              Polyline([
                LatLng(52.236372, 8.0225185),
                LatLng(52.283954, 8.0225185),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
