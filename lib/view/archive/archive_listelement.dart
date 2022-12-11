import 'package:flutter/material.dart';
import 'package:listroots/logic/archive/archive_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => ArchiveBloc(),
      child: ListTile(
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
            BlocBuilder<ArchiveBloc, ArchiveState>(
              builder: (context, state) {
                return IconButton(
                  icon: state.uploaded
                      ? Icon(
                          Icons.check_circle_outline,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : Icon(
                          Icons.upload_outlined,
                        ),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    context
                        .read<ArchiveBloc>()
                        .add(ChangeUploadStateEvent(context, state.uploaded));
                  },
                );
              },
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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ListelementDetail()));
        }),
      ),
    );
  }
}
