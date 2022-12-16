import 'package:flutter/cupertino.dart';
import 'package:latlng/latlng.dart';
import 'package:listroots/data/database/detection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Supabase_Manager {
  final String url = 'https://kztjsfosbeyiiymkrzty.supabase.co';
  final String key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6dGpzZm9zYmV5aWl5bWtyenR5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk2NDczNTcsImV4cCI6MTk4NTIyMzM1N30.HpfSQXTBl1pFJ2pzX-hflIjtIUzqLBM6QIVzgX8rymg';
  static final Supabase_Manager _instance = Supabase_Manager._internal();
  factory Supabase_Manager() => _instance;

  Supabase_Manager._internal() {
    WidgetsFlutterBinding.ensureInitialized();
    Supabase.initialize(url: this.url, anonKey: this.key);
  }

  Future readData() async {
    List<dynamic> response =
        await Supabase.instance.client.from('root_damage').select();
    print(response);
    return response;
  }

  Future<void> writeData(
      int id,
      String date,
      double longitude,
      double latitude,
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
