import 'package:flutter/material.dart';
import 'package:listroots/data/database/database_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  var supabase = Supabase_Manager();
  await Supabase.initialize(url: supabase.url, anonKey: supabase.key);
  runApp(const App());
}
