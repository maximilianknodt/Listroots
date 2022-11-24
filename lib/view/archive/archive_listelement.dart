import 'package:flutter/material.dart';

import 'listelement_detail.dart';

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
          IconButton(
            icon: Icon(Icons.upload_outlined),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {},
          ),
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.secondary,
          )
        ],
      ),
      dense: true,
      visualDensity: VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      onTap: (() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ListelementDetail()));
      }),
    );
  }
}
