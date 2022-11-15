import 'package:flutter/material.dart';

import '../../../logic/map_settings/map_settings_bloc.dart';
import 'checkbox_map_setting.dart';
import 'map_type_selection_buttons.dart';

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({
    Key? key,
    required DraggableScrollableController controller,
    this.maxSize = 0.4,
    this.minSize = 0.05,
  })  : _controller = controller,
        super(key: key);

  final DraggableScrollableController _controller;
  final double maxSize;
  final double minSize;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: minSize,
      minChildSize: minSize,
      maxChildSize: maxSize,
      snap: true,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), // TODO: theme extension
              topRight: Radius.circular(40), // TODO: theme extension
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  children: [
                    const SizedBox(height: 10), // TODO: theme extension
                    Center(
                      child: Container(
                        width: 50,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0, // TODO: theme extension
                        vertical: 8.0, // TODO: theme extension
                      ),
                      child: MapTypeSelectionButtons(),
                    ),
                    const CheckboxMapSetting(
                      title: "eigene Detektionen", // TODO: i18n
                      subtitle:
                          "von dir selbst detektierte Schäden", // TODO: i18n
                      event: MapSettingsEventToggleOwnDetections(),
                    ),
                    const CheckboxMapSetting(
                      title: "Detektionen von listroots-Nutzern", // TODO: i18n
                      subtitle:
                          "durch Dritte dokumentierte Schäden", // TODO: i18n
                      event: MapSettingsEventToggleForeignDetections(),
                    ),
                    const CheckboxMapSetting(
                      title: "OpenStreetMap Smoothness", // TODO: i18n
                      event: MapSettingsEventToggleOsmSmoothness(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
