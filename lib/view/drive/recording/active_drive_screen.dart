import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:listroots/view/widgets/map/static_map.dart';

class ActiveDriveScreen extends StatelessWidget {
  const ActiveDriveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
          ),
          onPressed: () => GoRouter.of(context).pop(), // TODO: go back to drive
        ),
        title: Text(AppLocalizations.of(context)!.continuousRecording),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // TODO: RecordingDisplay
          Expanded(
            // Frage: Warum muss hier auf einmal Expanded hin, damit kein Render Fehler auftritt? 'RenderBox was not laid out'
            child: Stack(
              children: <Widget>[
                //StaticMap(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/rootDmg.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // TODO: SensorMeter
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextButton.icon(
                          onPressed: () {}, // TODO: onpressed implementieren
                          icon: Icon(Icons.camera_alt),
                          label: Text(
                              AppLocalizations.of(context)!.recordPosition),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {}, // TODO: onpressed implementieren
                        icon: Icon(Icons.pause),
                        label: Text(AppLocalizations.of(context)!.stopRide),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
