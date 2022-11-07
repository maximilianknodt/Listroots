import 'package:flutter/material.dart';

import 'home.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFF5F9220), //Primärfarbe
              secondary: Color(0xFF181F0F), // Text-Farbe
              tertiary: Color(
                  0xC0181F0F), //sekundäre Text-Farbe (Text-Farbe 75%(0xC0 alpha))
              error: Color(0xFFFF0000),
              onError: Color(0xFFFFFFFF),
              background: Color(0xFFF5F5F4),
              primaryContainer: Color(0xFFEBEBEA),
              surface: Color(0XFFEBEBEA), // --> Canvas
              onSurface: Color(0xFF181F0F),
              //nur da, weil required
              onPrimary: Color(0xFFFFFFFF),
              onBackground: Color(0xFFFFFFFF),
              onSecondary: Color(0xFFFFFFFF)),
          fontFamily: 'IBM Plex Sans',
          textTheme: const TextTheme(
            //Font-Weight class https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html
            //w600 = semi-bold, w500 = medium, w400 = regular
            // Text-secondary fehlt noch
            titleLarge: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF181F0F)),
            titleMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF181F0F)),
            titleSmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF181F0F)),
            displayLarge: TextStyle(
                fontSize: 57,
                fontFamily: 'Swistblnk Monthoers',
                color: Color(0xFF181F0F)),
            displayMedium: TextStyle(
                fontSize: 45,
                fontFamily: 'Swistblnk Monthoers',
                color: Color(0xFF181F0F)),
            displaySmall: TextStyle(
                fontSize: 36,
                fontFamily: 'Swistblnk Monthoers',
                color: Color(0xFF181F0F)),
            labelLarge: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF181F0F)),
            labelMedium: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF181F0F)),
            labelSmall: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFF181F0F)),
            bodyLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF181F0F)),
            bodyMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF181F0F)),
            bodySmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF181F0F)),
            headlineLarge: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color(0xFF181F0F)),
            headlineMedium: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color(0xFF181F0F)),
            headlineSmall: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xFF181F0F)),
          )),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xFF5F9220), // Primärfarbe
            secondary: Color(0xFFF5F5F4), // Text-Farbe
            tertiary:
                Color(0xC0F5F5F4), // sekundäre Text-Farbe (Text-Farbe 75%)
            error: Color(0xFFFF0000),
            onError: Color(0xFFFFFFFF),
            background: Color(0xFF141611),
            primaryContainer: Color(0xFF29341D),
            surface: Color(0xFF1F221A), // --> Canvas
            onSurface: Color(0xFFF5F5F4),
            //nur da, weil required
            onPrimary: Color(0xFFFFFFFF),
            onBackground: Color(0xFFFFFFFF),
            onSecondary: Color(0xFFFFFFFF)),
        fontFamily: 'IBM Plex Sans',
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
