import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map/map.dart';

import 'tile_url_builder/tile_url_builder.dart';

class MapTileLayer extends StatelessWidget {
  final TileUrlBuilder tileUrlBuilder;

  // can't be const, because it needs to rebuild when the controller changes
  // ignore: prefer_const_constructors_in_immutables
  MapTileLayer({
    Key? key,
    required this.tileUrlBuilder,
  }) : super(key: key);

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

        return ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Color.fromARGB(255, 255, 255, 255),
            BlendMode.saturation,
          ),
          child: CachedNetworkImage(
            imageUrl: tileUrlBuilder.call(x, y, z),
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
