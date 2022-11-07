import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map/map.dart';

import 'tile_url_builder/tile_url_builder.dart';

class MapTileLayer extends StatelessWidget {
  const MapTileLayer({
    Key? key,
    required this.tileUrlBuilder,
  }) : super(key: key);

  final TileUrlBuilder tileUrlBuilder;

  @override
  Widget build(BuildContext context) {
    return TileLayer(
      builder: (context, x, y, z) {
        final tilesInZoom = pow(2.0, z).floor();

        while (x < 0) {
          x += tilesInZoom;
        }
        while (y < 0) {
          y += tilesInZoom;
        }

        x %= tilesInZoom;
        y %= tilesInZoom;

        return CachedNetworkImage(
          imageUrl: tileUrlBuilder.call(x, y, z),
          fit: BoxFit.cover,
        );
      },
    );
  }
}
