// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:listroots/view/home/stats_card.dart';

import '../widgets/general/section.dart';
import '../widgets/map/recorded_trip_map.dart';
import 'buttons/continous_recording_button.dart';
import 'buttons/manual_documentation_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Section(
            title: "Aufzeichnung starten",
            leading: Icon(Icons.directions_bike_outlined),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ContinousRecordingButton()),
                  VerticalDivider(color: Colors.transparent),
                  Expanded(child: ManualDocumentationButton()),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Section(
            title: "letzte Aufzeichnung",
            leading: Icon(Icons.pedal_bike_outlined),
            child: SizedBox(
              height: 300,
              child: RecordedTripMap(
                start: DateTime.now(),
                end: DateTime.now()..subtract(const Duration(hours: 1)),
                path: const [
                  LatLng(52.27262175883876, 8.04809522538859),
                  LatLng(52.272920574108596, 8.049362430692437),
                  LatLng(52.27411581504878, 8.050543095179428),
                  LatLng(52.27454321934981, 8.049671505173729),
                  LatLng(52.27508787016352, 8.04886791156641),
                  LatLng(52.2744902668304, 8.047260724351775),
                  LatLng(52.27457726022175, 8.046852746058828),
                  LatLng(52.274599954121825, 8.046413860319445),
                  LatLng(52.274516743098005, 8.046389134362299),
                  LatLng(52.27396452052699, 8.04510338459059),
                ],
                detections: const [
                  LatLng(52.27477079208176, 8.048024621625713),
                  LatLng(52.274955037472004, 8.048464251735915),
                  LatLng(52.27341103744562, 8.0498373429437715),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Section(
            title: "meine Statistiken",
            leading: Icon(Icons.auto_graph_outlined),
            onTap: () {},
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    StatsCard(
                      title: 'Erkennungen von Schäden (insgesamt)',
                      value: '42',
                    ),
                    SizedBox(width: 10),
                    StatsCard(
                      title: 'Erkennungen von Schäden (insgesamt)',
                      value: '42',
                    ),
                    SizedBox(width: 10),
                    StatsCard(
                      title: 'Erkennungen von Schäden (insgesamt)',
                      value: '42',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
