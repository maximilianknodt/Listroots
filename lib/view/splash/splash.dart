import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../logic/splash/splash_bloc.dart';
// import '../home/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: _listener,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/icons/logo_green_rounded.png'),
              ),
              const SizedBox(height: 30),
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
      ),
    );
  }

  void _listener(context, state) {
    if (state is EndSplash) {
      GoRouter.of(context).replace('/home');
      log("Home muss gezeigt werden!");
    }
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
