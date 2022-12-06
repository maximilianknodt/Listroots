import 'package:flutter/material.dart';

import '../home/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/logo_green_rounded.png'),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text(
                'listroots',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                'Kartographie von Wurzelschäden',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(25),
        color: Theme.of(context).colorScheme.background,
        child: (Text(
          'Ein Projekt von Christoph Hüsemann, Jannis Gärtner, Lukas Lübberding, Alexander Führs, Thorben Fabrewitz und Maximilian Knodt',
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     _navigatetohome();
//   }

//   _navigatetohome() async {
//     await Future.delayed(Duration(seconds: 3), () {});
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => Home()));
//   }

//   @override
  
// }
