import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/geo/gps/gps_bloc.dart';
import '../../../logic/map/settings/map_settings_bloc.dart';

class FocusGpsPosFAB extends StatelessWidget {
  const FocusGpsPosFAB({
    Key? key,
    required this.isOpen,
  }) : super(key: key);

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: isOpen ? 0 : 1,
      child: FloatingActionButton(
        heroTag: 'focus_gps_location_fab',
        onPressed: () => _onPressed(context),
        child: BlocBuilder<MapSettingsBloc, MapSettingsState>(
          builder: (context, state) {
            bool isLoading =
                state is MapSettingsInitial || (state).loadingPosition;
            if (isLoading) {
              return const CircularProgressIndicator(); // TODO: custom loading widget
            } else {
              return Icon(Icons.gps_fixed_outlined);
            }
          },
        ),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final gpsBloc = BlocProvider.of<GpsBloc>(context);

    final mapBloc = BlocProvider.of<MapSettingsBloc>(context);
    mapBloc.add(SetMapCenterEvent(null));

    final position = await gpsBloc.currentLocation;
    if (position == null) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('GPS-Position ist nicht verfügbar'),
      )); // TODO: i18n
      return;
    }

    mapBloc.add(SetMapCenterEvent(position));
    log('Setting map center to ${position.latitude}, ${position.longitude}');
  }
}
