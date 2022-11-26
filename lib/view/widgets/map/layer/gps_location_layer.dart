import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map/map.dart';

import '../../../../logic/geo/gps/gps_bloc.dart';
import '../../general/blur/blur_layer.dart';
import '../location_dot/animated_current_location_marker_dot.dart';
import 'layer_builder.dart';

class GpsLocationLayer extends LayerBuilder {
  const GpsLocationLayer({
    this.color,
    this.backgroundColor,
  });

  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, MapTransformer transformer) {
    return BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        if (state is GpsLocation) {
          return AnimatedCurrentLocationMarkerDot(
            latlng: state.location,
            transformer: transformer,
            color: color,
            backgroundColor: backgroundColor,
          );
        } else if (state is GpsLoading) {
          return Positioned.fill(
            child: Container(
              color: Theme.of(context).colorScheme.background.withOpacity(0.5),
              child: BlurLayer(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ); // TODO: Loading Widget
        } else {
          return Container();
        }
      },
    );
  }
}
