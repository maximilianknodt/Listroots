import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlng/latlng.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Resultscreen extends StatelessWidget {
  const Resultscreen({
    super.key,
    required this.position,
    required this.timestamp,
    this.confidence,
    required this.hasDetected,
  });

  final LatLng position;
  final DateTime timestamp;
  final double? confidence; // TODO: refactor
  final bool hasDetected;

  static const String _rDmg = "assets/images/rootDmg.jpg";
  static const double _ratio = 3 / 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
          ),
          onPressed: () {},
        ),
        title: Text(AppLocalizations.of(context)!.manuellDocumentation),
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
            hasDetected
                ? ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.check),
                    label: Text(AppLocalizations.of(context)!.documentation),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
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
                          onPressed: () {},
                          icon: Icon(Icons.close),
                          label: Text(AppLocalizations.of(context)!.cancel),
                        ),
                      ),
                    ],
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
