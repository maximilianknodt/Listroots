import 'package:flutter/material.dart';

class ArchiveListelement extends StatelessWidget {
  const ArchiveListelement({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "22.10.22 13:37 Uhr",
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Text(
        "0,37h, 3 Detektionen",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.upload,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.secondary,
          )
        ],
      ),
    );
  }
}
