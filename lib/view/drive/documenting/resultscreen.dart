import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlng/latlng.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Resultscreen extends StatelessWidget {
  Resultscreen({super.key});

  final LatLng position = LatLng(51.5, -0.09);
  final DateTime timestamp = DateTime(2023, 1, 1);
  final double? confidence = 0.8;
  final bool hasDetected = true;

  static const String _rDmg = "assets/images/rootDmg.jpg";
  static const double _ratio = 3 / 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.manualDocumentation),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: AspectRatio(
                aspectRatio: _ratio,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    _rDmg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: hasDetected
                  ? _addtextTitle(
                      context, AppLocalizations.of(context)!.damageFound)
                  : _addtextTitle(
                      context, AppLocalizations.of(context)!.noDamageFound),
            ),
            if (hasDetected)
              _addTextBody(
                context,
                AppLocalizations.of(context)!.confidence + ": ${confidence} %",
              ),
            _addTextBody(
                context,
                AppLocalizations.of(context)!.position +
                    ": ${position.latitude} | ${position.longitude}"),
            _addTextBody(context, _formattedTimeString(context)),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: hasDetected
                  ? null
                  : _addTextBody(
                      context,
                      AppLocalizations.of(context)!.damageNotFoundQuestion,
                    ),
            ),
            Spacer(),
            SafeArea(
              child: hasDetected
                  ? ElevatedButton.icon(
                      onPressed: () {}, // TODO: onpressed implementieren
                      icon: Icon(Icons.check),
                      label: Text(AppLocalizations.of(context)!.documentation),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton.icon(
                          onPressed: () {}, // TODO: onpressed implementieren
                          icon: Icon(Icons.check),
                          label: Text(
                              AppLocalizations.of(context)!.stillDocumentation),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).colorScheme.onSecondary,
                            ),
                            onPressed: () {}, // TODO: onpressed implementieren
                            icon: Icon(Icons.close),
                            label: Text(AppLocalizations.of(context)!.cancel),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  String _formattedTimeString(BuildContext context) {
    DateFormat time = DateFormat("dd.MM.yyyy hh:mm");
    return AppLocalizations.of(context)!.timestamp +
        ": " +
        time.format(timestamp) +
        " " +
        AppLocalizations.of(context)!.clock;
  }

  Text _addtextTitle(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Text _addTextBody(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
