import 'package:flutter/material.dart';

class Analysescreen extends StatelessWidget{
  const Analysescreen({super.key});

  static const String _analyse = "analysiere Fahrbahn";
  static const String _location = "und ermittle Standort";

  static const String _asset = "assets/images/road.png";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,    // default, hat aber nicht geklappt, daher als Child von Center
          children: <Widget> [
            Expanded(
              flex: 3,
              child: Image.asset(_asset),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>
                        (Colors.green.shade900),
                      ),
                    ),
                    addText(_analyse),
                    addText(_location),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text addText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}