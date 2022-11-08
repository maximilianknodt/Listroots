import 'package:flutter/material.dart';
import 'package:listroots/theme.dart';

import 'home.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppColorTheme().theme,
      darkTheme: AppColorTheme().darkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
