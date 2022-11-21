import 'package:flutter/material.dart';

class ArchiveListelement extends StatelessWidget {
  const ArchiveListelement({
    super.key,
    required this.date,
    required this.value,
  });

  final String date;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        date,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Text(
        value,
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
