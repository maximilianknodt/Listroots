import 'package:flutter/material.dart';

/// This class is used to define the color theme for the app.
///
/// The theme is defined in the [theme] property. The [darkTheme] property is used to define the dark theme.
/// The [theme] and [darkTheme] properties are used in the [MaterialApp] widget.
class AppColorTheme {
  // fonts
  static const String _ibmPlexSans = 'IBM Plex Sans';
  static const String _swistblnkMonthoers = 'Swistblnk Monthoers';
  static const FontWeight _semibold = FontWeight.w600;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _regular = FontWeight.w400;

  // colors
  static const Color _primary = Color(0xFF5F9220); // Primärfarbe
  static const Color _primaryContainer = Color(0xFFEBEBEA);
  static const Color _text = Color(0xFF181F0F); // Text-Farbe
  static const Color _textSecondary = Color(0xC0181F0F);
  //sekundäre Text-Farbe (Text-Farbe 75%(0xC0 alpha))
  static const Color _canvas = Color(0XFFEBEBEA); // --> Canvas
  static const Color _background = Color(0xFFF5F5F4);

  ThemeData get theme => ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: _primary,
          secondary: _text,
          tertiary: _textSecondary,
          error: Color(0xFFFF0000),
          onError: Color(0xFFFFFFFF),
          background: _background,
          primaryContainer: _primaryContainer,
          surface: _canvas,
          onSurface: _text,
          //nur da, weil required
          onPrimary: Color(0xFFFFFFFF),
          onBackground: Color(0xFFFFFFFF),
          onSecondary: Color(0xFFFFFFFF),
        ),
        fontFamily: _ibmPlexSans,
        textTheme: TextTheme(
          //Font-Weight class https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html
          //w600 = semi-bold, w500 = medium, w400 = regular
          // Text-secondary fehlt noch
          titleLarge: _title(22),
          titleMedium: _title(16),
          titleSmall: _title(14),
          displayLarge: _display(57),
          displayMedium: _display(45),
          displaySmall: _display(34),
          labelLarge: _label(14),
          labelMedium: _label(12),
          labelSmall: _label(11),
          bodyLarge: _body(16),
          bodyMedium: _body(14),
          bodySmall: _body(12),
          headlineLarge: _headline(32),
          headlineMedium: _headline(28),
          headlineSmall: _headline(24),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF5F9220), // Primärfarbe
          secondary: Color(0xFFF5F5F4), // Text-Farbe
          tertiary: Color(0xC0F5F5F4), // sekundäre Text-Farbe (Text-Farbe 75%)
          error: Color(0xFFFF0000),
          onError: Color(0xFFFFFFFF),
          background: Color(0xFF141611),
          primaryContainer: Color(0xFF29341D),
          surface: Color(0xFF1F221A), // --> Canvas
          onSurface: Color(0xFFF5F5F4),
          //nur da, weil required
          onPrimary: Color(0xFFFFFFFF),
          onBackground: Color(0xFFFFFFFF),
          onSecondary: Color(0xFFFFFFFF),
        ),
        fontFamily: _ibmPlexSans,
      );

  TextStyle _title(double size) =>
      TextStyle(fontSize: size, fontWeight: _semibold, color: _text);

  TextStyle _display(double size) => TextStyle(
      fontSize: size, fontFamily: _swistblnkMonthoers, color: _primary);

  TextStyle _body(double size) =>
      TextStyle(fontSize: size, fontWeight: _regular, color: _text);

  TextStyle _label(double size) =>
      TextStyle(fontSize: size, fontWeight: _medium, color: _textSecondary);

  TextStyle _headline(double size) =>
      TextStyle(fontSize: size, fontWeight: _medium, color: _text);
}
