import 'package:flutter/material.dart';

import '../widgets/map/interactive_map.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const InteractiveMap(),
        DraggableScrollableSheet(
          controller: DraggableScrollableController(),
          initialChildSize: 0.05,
          minChildSize: 0.05,
          maxChildSize: 0.35,
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
                      physics: const ClampingScrollPhysics(),
                      controller: scrollController,
                      children: [
                        const SizedBox(height: 10), // TODO: theme extension
                        Center(
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: true,
                          onChanged: (value) {},
                          title: Text("eigene Detektionen"), // TODO: i18n
                          subtitle: Text(
                              "von dir selbst detektierte Schäden"), // TODO: i18n
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: true,
                          onChanged: (value) {},
                          title: Text(
                              "Detektionen von listroots-Nutzern"), // TODO: i18n
                          subtitle: Text(
                              "durch Dritte dokumentierte Schäden"), // TODO: i18n
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: true,
                          onChanged: (value) {},
                          title: Text("OpenStreetMap Smoothness"), // TODO: i18n
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
