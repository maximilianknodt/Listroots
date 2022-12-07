import 'package:flutter/widgets.dart';
import 'package:map/map.dart';

import 'layer_builder.dart';

class TransformerLayerBuilder extends LayerBuilder {
  const TransformerLayerBuilder({
    required this.builder,
  });

  final Widget Function(BuildContext context, MapTransformer offset) builder;

  @override
  Widget build(BuildContext context, MapTransformer transformer) {
    return builder(context, transformer);
  }
}
