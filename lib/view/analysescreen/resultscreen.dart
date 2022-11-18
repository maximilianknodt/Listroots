import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultscreen extends StatelessWidget {
  Resultscreen({super.key});

  bool _hasDetected = false;

  static const String _rDmg = "assets/images/rootDmg.jpg";
  static const double _ratio = 4 / 3;

  static const String _damage = "Schaden erkannt";
  static const String _noDamage = "Keine Fahrbahnschäden erkannt";

  static int _confValue = 86;
  String _conf = "Konfidenz: ${_confValue} %";

  static String _lat = "52° 14’271”";
  static String _long = "008° 16’291”";
  String _position = "Position: ${_lat} | ${_long}";

  static String _date = "18.11.2022";
  static String _time = "17:42";
  String _timestamp = "Zeitpunkt: ${_date} ${_time} Uhr";

  static const String _question =
      "Bist du dir sicher, dass es sich hierbei um einen Fahrbahnschaden (wie Wurzelschaden) handelt und du diese Stelle tatsächlich dokumentieren möchtest?";

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
        title: const Text("manuell dokumentieren"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              // TODO: Egal ob AspectRatio, oder ClipRRect zuerst, egal ob mit, oder ohne Container
              borderRadius: BorderRadius.circular(1000),
              child: AspectRatio(
                aspectRatio: _ratio,
                child: Image.asset(_rDmg),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: _hasDetected
                  ? addtextTitle(context, _damage)
                  : addtextTitle(context, _noDamage),
            ),
            if (_hasDetected) addTextBody(context, _conf),
            addTextBody(context, _position),
            addTextBody(context, _timestamp),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: _hasDetected ? null : addTextBody(context, _question),
            ),
            Spacer(),
            _hasDetected
                ? ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.check),
                    label: Text("Dokumentieren"),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.check),
                        label: Text("ja, trotzdem dokumentieren"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextButton.icon(
                            style: TextButton.styleFrom(
                                foregroundColor:
                                    Theme.of(context).colorScheme.onSecondary),
                            onPressed: () {},
                            icon: Icon(Icons
                                .cancel_outlined), // TODO: Icon ohne outline finden
                            label: Text("abbrechen")),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Text addtextTitle(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Text addTextBody(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
