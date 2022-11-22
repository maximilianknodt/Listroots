import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:go_router/go_router.dart';
import '../../logic/mode/photo/photo_bloc.dart';

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
            onPressed: () => GoRouter.of(context).push('/recording'),
            icon: const Icon(Icons.play_arrow_outlined),
            label: Text(AppLocalizations.of(context)!.startRecording),
          ),
          const Divider(color: Colors.transparent),
          TextButton.icon(
            onPressed: () => _manualDocumentation(context),
            icon: const Icon(Icons.linked_camera),
            label: Text(AppLocalizations.of(context)!.manualDocumentation),
          ),
        ],
      ),
    );
  }

  void _manualDocumentation(BuildContext context) {
    BlocProvider.of<PhotoBloc>(context).add(Analyze());
    GoRouter.of(context).push('/documenting');
  }
}
