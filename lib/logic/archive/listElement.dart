import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  const ListElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Koordinaten"),
                  Text("Uhrzeit + Konfidenz")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Icon(Icons.gps_fixed_outlined)],
              )
            ]),
      ),
    );
  }
}
