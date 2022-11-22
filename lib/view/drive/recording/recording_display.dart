import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';

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
