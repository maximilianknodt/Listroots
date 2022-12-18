import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:go_router/go_router.dart';

import '../../../logic/mode/drive/drive_bloc.dart';
import '../../../logic/sensor/sensor_bloc.dart';
import 'active_drive_screen_body.dart';

class ActiveDriveScreen extends StatelessWidget {
  const ActiveDriveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => GoRouter.of(context).pop()),
        title: Text(AppLocalizations.of(context)!.continuousRecording),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DriveBloc()),
          BlocProvider(create: (context) => SensorBloc()..add(SensorsStart())),
        ],
        child: ActiveDriveScreenBody(),
      ),
    );
  }
}
