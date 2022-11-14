import 'package:flutter/material.dart';

import 'map_tile_layer.dart';

class ColorFilteredMapTileLayer extends MapTileLayer {
  ColorFilteredMapTileLayer({
    super.key,
    required super.tileUrlBuilder,
  });

  List<ColorFilter> colorFilters(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // desaturate image
    const desaturation = ColorFilter.mode(Colors.black, BlendMode.saturation);

    // decrease influence of very dark (lightmode) or very light (darkmode) colors
    final thresholdColor = isDark
        ? const Color.fromARGB(255, 232, 232, 232)
        : const Color.fromARGB(255, 197, 197, 197);
    final brightnessFilter = ColorFilter.mode(
      thresholdColor,
      (isDark ? BlendMode.darken : BlendMode.lighten),
    );

    final brightnessAdjustment = ColorFilter.matrix(
      _brightnessAdjustMatrix(-0.6),
    );

    // overlay dark or light color to match color scheme
    final overlay = ColorFilter.mode(
      Theme.of(context).colorScheme.background.withOpacity(isDark ? 0.5 : 0.4),
      BlendMode.srcATop,
    );

    return [
      desaturation,
      if (isDark) brightnessAdjustment,
      brightnessFilter,
      overlay,
    ];
  }

  @override
  Widget imageBuilder(context, imageProvider) {
    Widget child = Image(image: imageProvider, fit: BoxFit.cover);
    for (var filter in colorFilters(context)) {
      child = ColorFiltered(colorFilter: filter, child: child);
    }
    return child;
  }

  List<double> _brightnessAdjustMatrix(double value) {
    value *= value <= 0 ? 255 : 100;

    if (value == 0) {
      return [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
    }

    return [
      ...[1, 0, 0, 0, value],
      ...[0, 1, 0, 0, value],
      ...[0, 0, 1, 0, value],
      ...[0, 0, 0, 1, 0]
    ];
  }
}
