import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';
import 'package:listroots/view/widgets/map/static_map.dart';

class ActiveDriveScreen extends StatelessWidget {
  const ActiveDriveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => GoRouter.of(context).pop()),
        title: Text(AppLocalizations.of(context)!.continuousRecording),
      ),
      body: Column(
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
                        Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.0),
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
                          child: SensorMeter(rash: 0.7),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextButton.icon(
                            onPressed: _savePosition,
                            icon: Icon(Icons.camera_alt),
                            label: Text(
                                AppLocalizations.of(context)!.recordPosition),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _stopRide,
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
      ),
    );
  }

  void _savePosition() {}

  void _stopRide() {}
}

extension DurationFormat on Duration {
  String format() => this.toString().split('.').first.padLeft(8, "0");
}

class RecordingDisplay extends StatelessWidget {
  const RecordingDisplay({
    super.key,
    required this.duration,
    required this.timestamp,
  });

  final Duration duration;
  final DateTime timestamp;

  @override
  Widget build(BuildContext context) {
    DateFormat time = DateFormat(DateFormat.HOUR24_MINUTE);
    String strTime = time.format(timestamp);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //TODO: RecordingDot Anstelle des Icons
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            Icons.lens,
            color: Colors.red,
            size: 20,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.recordingActive,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "${duration.format()} (${AppLocalizations.of(context)!.startedAt} $strTime Uhr)",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

class SensorMeter extends StatelessWidget {
  const SensorMeter({
    super.key,
    this.rash = 0.0,
  }) : assert(rash >= 0.0 && rash <= 1.0);

  final double rash;
  final double height = 3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: height,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        FractionallySizedBox(
          widthFactor: rash,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: height,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
