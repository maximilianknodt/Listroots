import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// fragt nicht. Das ist super dumm
// https://stackoverflow.com/questions/62432229/how-to-assign-hexadecimal-color-code-in-primaryswatch-in-flutter
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
