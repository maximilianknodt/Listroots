import 'package:supabase_flutter/supabase_flutter.dart';

class Supabase_Manager {
  final String url = 'https://kztjsfosbeyiiymkrzty.supabase.co';
  final String key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6dGpzZm9zYmV5aWl5bWtyenR5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk2NDczNTcsImV4cCI6MTk4NTIyMzM1N30.HpfSQXTBl1pFJ2pzX-hflIjtIUzqLBM6QIVzgX8rymg';

  Future readData() async {
    List<dynamic> response =
        await Supabase.instance.client.from('root_damage').select();

    print(response);
    return response;
  }

  Future<void> writeData(int id, String date, double longitude, double latitude) async {
    await Supabase.instance.client.from('root_damage').insert({
      'user_id': id,
      'date': date,
      'longitude': longitude,
      'latitude': latitude
    });
  }
}
