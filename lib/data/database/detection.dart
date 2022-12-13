/*LatLng 

DateTime - Start + Ende 

Double (0-1) Gesamt-Konfidenz 

Double (0-1) Image-Konfidenz 

Double (0-1) Sensor-Konfidenz 

automatisch hochzählende ID als Primary key 

DeviceID zur Identifikation eines Users / Generierung einer UUID beim ersten Starten der App 

Anzeige der Datenpunkte auf der Karte: Methode, welche Datenpunkte in einem bestimmten Bereich zurückliefert (begrenzt von zwei Extrempunkten --> Recherche zur Map) 

- Beim Laden von mehreren Tiles alle Datenpunkte auf einmal abfragen 
eigene Detektion lokal speichern (wie?) z.B. Hive, sqlite 
boolean wurdeHochgeladen

Datenmodell für die Fahrten (mit mehreren Datenpunkten) */

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:latlng/latlng.dart';

class Detection {
  LatLng position;
  DateTime time;
  double confidenceTotal;
  double confidenceImage;
  double confidenceSensor;
  String? deviceID = _getId() as String?;

  //TODO: deviceID muss zugewiesen werden
  Detection(this.position, this.time, this.confidenceTotal,
      this.confidenceImage, this.confidenceSensor);

  static Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    String? deviceID;
    if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      deviceID = iosInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceID = androidDeviceInfo.id;
    }
    return deviceID;
  }
}
