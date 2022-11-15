import 'package:flutter/material.dart';
import 'package:map/map.dart';

abstract class LayerBuilder {
  const LayerBuilder({Key? key});
  Widget build(BuildContext context, MapTransformer transformer);
}
