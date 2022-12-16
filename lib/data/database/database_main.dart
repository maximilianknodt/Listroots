import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Supabase_Manager {
  final String url = 'https://kztjsfosbeyiiymkrzty.supabase.co';
  final String key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6dGpzZm9zYmV5aWl5bWtyenR5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk2NDczNTcsImV4cCI6MTk4NTIyMzM1N30.HpfSQXTBl1pFJ2pzX-hflIjtIUzqLBM6QIVzgX8rymg';
  String deviceID = 'no UserID';
  static final Supabase_Manager _instance = Supabase_Manager._internal();
  factory Supabase_Manager() => _instance;

  Supabase_Manager._internal() {
    WidgetsFlutterBinding.ensureInitialized();
    Supabase.initialize(url: this.url, anonKey: this.key);
    init();
  }

  Future<void> init() async {
    this.deviceID = await getId();
    print('DeviceID is: ' + this.deviceID);
  }

  static Future getId() async {
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

  Future readData() async {
    List<dynamic> response =
        await Supabase.instance.client.from('root_damage').select();
    print(response);
    return response;
  }

  // Date-Format must be like '2022-12-24 00:00:01'
  Future<void> writeData(
      String id,
      String date,
      double latitude,
      double longitude,
      double confidencTotal,
      double confidenceImage,
      double confidenceSensor) async {
    await Supabase.instance.client.from('root_damage').insert({
      'user_id': id,
      'date': date,
      'latitude': latitude,
      'longitude': longitude,
      'confidencetotal': confidencTotal,
      'confidenceimage': confidenceImage,
      'confidencesensor': confidenceSensor
    });
  }
}
