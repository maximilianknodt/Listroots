import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/sensor/sensor_bloc.dart';
import '../../widgets/map/static_map.dart';
import 'recording_display.dart';
import 'sensor_meter.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ActiveDriveScreenBody extends StatelessWidget {
  const ActiveDriveScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: RecordingDisplay(
            duration: Duration(hours: 2, minutes: 13),
            timestamp: DateTime.now(),
          ),
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              StaticMap(),
              Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: <Color>[
                      Theme.of(context).colorScheme.background,
                      Theme.of(context).colorScheme.background.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25, 10, 25, 10),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 5 / 3, // TODO: Bildgroesse klaeren
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/rootDmg.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SensorMeter(),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt),
                          label: Text(
                              AppLocalizations.of(context)!.recordPosition),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.pause),
                        label: Text(AppLocalizations.of(context)!.stopRide),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
