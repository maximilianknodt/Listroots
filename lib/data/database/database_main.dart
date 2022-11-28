import 'package:supabase_flutter/supabase_flutter.dart';

class database {
  Future<void> main() async {
    await Supabase.initialize(
        url: 'https://kztjsfosbeyiiymkrzty.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6dGpzZm9zYmV5aWl5bWtyenR5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk2NDczNTcsImV4cCI6MTk4NTIyMzM1N30.HpfSQXTBl1pFJ2pzX-hflIjtIUzqLBM6QIVzgX8rymg');
  }
}
