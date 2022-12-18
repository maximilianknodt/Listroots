import 'package:listroots/data/database/detection.dart';

class Trip {
  DateTime start;
  DateTime? end;
  List<Detection> detections = [];

  Trip(this.start);

  addDetection(Detection det) {
    this.detections.add(det);
  }

  endTrip(DateTime end) {
    this.end = end;
  }
}
