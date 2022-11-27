import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/map/settings/map_settings_bloc.dart';

class CheckboxMapSetting extends StatelessWidget {
  const CheckboxMapSetting({
    Key? key,
    required this.title,
    this.subtitle,
    required this.selected,
    required this.event,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool selected;
  final MapSettingsEvent event;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: selected,
      onChanged: (value) {
        BlocProvider.of<MapSettingsBloc>(context).add(event);
      },
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
    );
  }
}
