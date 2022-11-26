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

  // light colors
  static const Color _primary = Color(0xFF5F9220); // Primärfarbe
  static const Color _primaryContainer = Color(0xFFEBEBEA);
  static const Color _text = Color(0xFF181F0F); // Text-Farbe
  static const Color _textSecondary = Color(0xC0181F0F);
  //sekundäre Text-Farbe (Text-Farbe 75%(0xC0 alpha))
  static const Color _canvas = Color(0XFFFDFEFC); // --> Canvas
  static const Color _background = Color(0xFFF5F5F4);

// dark colors
  static const Color _primaryDark = _primary; // Primärfarbe
  static const Color _primaryContainerDark = Color(0xFF29341D);
  static const Color _textDark = Color(0xFFF5F5F4); // Text-Farbe
  static const Color _textSecondaryDark = Color(0xC0F5F5F4);
  //sekundäre Text-Farbe (Text-Farbe 75%(0xC0 alpha))
  static const Color _canvasDark = Color(0xFF1F221A); // --> Canvas
  static const Color _backgroundDark = Color(0xFF141611);

  static const ColorScheme _lightColorSheme = ColorScheme(
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
    onPrimary: _primaryContainer,
    onBackground: _text,
    onSecondary: _text,
    onTertiary: _canvas,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _primaryDark,
    secondary: _textDark,
    tertiary: _textSecondaryDark,
    error: Color(0xFFFF0000),
    onError: Color(0xFFFFFFFF),
    background: _backgroundDark,
    primaryContainer: _primaryContainerDark,
    surface: _canvasDark,
    onSurface: _textDark,
    onPrimary: _primaryContainerDark,
    onBackground: _textDark,
    onSecondary: _textDark,
    onTertiary: _canvasDark,
  );

  ThemeData get theme => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: _background,
          foregroundColor: _text,
          elevation: 0,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(_primary),
          checkColor: MaterialStateProperty.all(_primaryContainer),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _primary,
          foregroundColor: _canvas,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        scaffoldBackgroundColor: _background,
        bottomNavigationBarTheme: _bottomNavigationBarTheme(_lightColorSheme),
        colorScheme: _lightColorSheme,
        fontFamily: _ibmPlexSans,
        textTheme: _textTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(style: _baseButtonStyle),
        textButtonTheme: _textButtonTheme(_primaryContainer),
        outlinedButtonTheme: OutlinedButtonThemeData(style: _baseButtonStyle),
        toggleButtonsTheme: ToggleButtonsThemeData(
          color: _textSecondary,
          borderColor: _primaryContainer,
          fillColor: _primaryContainer,
          selectedColor: _primary,
          selectedBorderColor: _background,
          borderRadius: BorderRadius.circular(10),
          constraints: BoxConstraints(
            minHeight: 50,
            minWidth: 50,
          ),
        ),
        cardTheme: _cardTheme,
      );

  ThemeData get darkTheme => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: _darkColorScheme.background,
          foregroundColor: _darkColorScheme.onBackground,
          elevation: 0,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(_primaryDark),
          checkColor: MaterialStateProperty.all(_primaryContainerDark),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _primaryDark,
          foregroundColor: _canvasDark,
        ),
        bottomNavigationBarTheme: _bottomNavigationBarTheme(_darkColorScheme),
        scaffoldBackgroundColor: _darkColorScheme.background,
        colorScheme: _darkColorScheme,
        fontFamily: _ibmPlexSans,

        elevatedButtonTheme: ElevatedButtonThemeData(style: _baseButtonStyle),
        textButtonTheme: _textButtonTheme(const Color(
            0xFF29341D)), // TODO: use _primaryContainerDark after merge
        outlinedButtonTheme: OutlinedButtonThemeData(style: _baseButtonStyle),
        cardTheme: _cardTheme,
      );

  CardTheme get _cardTheme => CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );

  TextTheme get _textTheme => TextTheme(
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

  BottomNavigationBarThemeData _bottomNavigationBarTheme(
          ColorScheme colorScheme) =>
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: colorScheme.background,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onBackground,
        selectedLabelStyle: _label(12),
        unselectedLabelStyle: _label(12),
      );

  ButtonStyle get _baseButtonStyle => ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(100, 50),
        ),
      );

  TextButtonThemeData _textButtonTheme(Color backgroundColor) =>
      TextButtonThemeData(
        style: _baseButtonStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor,
          ),
        ),
      );
}
