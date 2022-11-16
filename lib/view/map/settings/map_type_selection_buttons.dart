import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/map/map_type.dart';
import '../../../logic/map_settings/map_settings_bloc.dart';
import 'map_type_toggle.dart';

class MapTypeSelectionButtons extends StatelessWidget {
  const MapTypeSelectionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapSettingsBloc, MapSettingsState>(
      builder: (context, state) {
        final mapType = state.mapType;
        return ToggleButtons(
          constraints: BoxConstraints(
            minWidth: (MediaQuery.of(context).size.width - 38) /
                MapType.values.length,
          ),
          onPressed: (index) {
            final newMapType = MapType.values[index];
            BlocProvider.of<MapSettingsBloc>(context).add(
              MapSettingsEventSetMapType(newMapType),
            );
          },
          isSelected: MapType.values.map((e) => e == mapType).toList(),
          children: MapType.values.map((e) => MapTypeToggle(e)).toList(),
        );
      },
    );
  }
}
