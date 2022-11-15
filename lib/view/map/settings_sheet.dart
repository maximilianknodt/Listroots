import 'package:flutter/material.dart';

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({
    Key? key,
    required DraggableScrollableController controller,
    this.maxSize = 0.35,
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
      snap: false,
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
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: true,
                      onChanged: (value) {},
                      title: const Text("eigene Detektionen"), // TODO: i18n
                      subtitle: const Text(
                          "von dir selbst detektierte Schäden"), // TODO: i18n
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: true,
                      onChanged: (value) {},
                      title: const Text(
                          "Detektionen von listroots-Nutzern"), // TODO: i18n
                      subtitle: const Text(
                          "durch Dritte dokumentierte Schäden"), // TODO: i18n
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: true,
                      onChanged: (value) {},
                      title:
                          const Text("OpenStreetMap Smoothness"), // TODO: i18n
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
