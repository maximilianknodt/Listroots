import 'package:flutter/material.dart';

import 'map_tile_layer.dart';

class ColorFilteredMapTileLayer extends MapTileLayer {
  ColorFilteredMapTileLayer({
    super.key,
    required super.tileUrlBuilder,
  });

  List<ColorFilter> colorFilters(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    // desaturate image
    const desaturation = ColorFilter.mode(Colors.black, BlendMode.saturation);

    // decrease influence of very dark (lightmode) or very light (darkmode) colors
    const brightnessFilter = ColorFilter.mode(
      Color.fromARGB(255, 197, 197, 197),
      BlendMode.lighten,
    );

    // overlay dark or light color to match color scheme
    final overlay = ColorFilter.mode(
      Theme.of(context).colorScheme.background.withOpacity(0.5),
      BlendMode.srcATop,
    );

    return [desaturation, brightnessFilter, overlay];
  }

  @override
  Widget imageBuilder(context, imageProvider) {
    Widget child = Image(image: imageProvider, fit: BoxFit.cover);
    for (var filter in colorFilters(context)) {
      child = ColorFiltered(colorFilter: filter, child: child);
    }
    return child;
  }
}
