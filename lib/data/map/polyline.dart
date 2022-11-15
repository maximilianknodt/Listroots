import 'dart:ui';

import 'package:latlng/latlng.dart';

class Polyline {
  const Polyline(this.data) : color = null;
  const Polyline.colored(this.data, {this.color});

  final List<LatLng> data;
  final Color? color;
}
