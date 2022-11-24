import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Drive extends StatelessWidget {
  const Drive({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // TODO: theme extension
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text("Drive"),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: navigate: GoRouter.of(context).pushNamed('/drive/recording');
            },
            icon: const Icon(Icons.play_arrow_outlined),
            label: Text(AppLocalizations.of(context)!
                .aufzeichnungStartenBtn), //TODO EXAMPLE OF Stringoutsourcing
          ),
          const Divider(color: Colors.transparent),
          TextButton.icon(
            onPressed: () {
              // TODO: navigate: GoRouter.of(context).push('/drive/documenting');
            },
            icon: const Icon(Icons.linked_camera),
            label: const Text("Manuell dokumentieren"),
          ),
        ],
      ),
    );
  }
}
