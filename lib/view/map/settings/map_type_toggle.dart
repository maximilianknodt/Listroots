import 'package:flutter/material.dart';

import '../../../data/map/map_type.dart';

class MapTypeToggle extends StatelessWidget {
  const MapTypeToggle(
    this.mapType, {
    Key? key,
  }) : super(key: key);

  final MapType mapType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), // TODO: theme extension
      child: Column(
        children: [
          Icon(mapType.icon),
          const SizedBox(height: 5), // TODO: theme extension
          Text(mapType.title),
        ],
      ),
    );
  }
}
