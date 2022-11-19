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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 2),
                    child: Text(
                      "52° 14'271\" | 008° 16'291\"",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 2),
                      child: Text(
                        "13:42 Uhr, 40% Konfidenz",
                        style: Theme.of(context).textTheme.labelSmall,
                        textAlign: TextAlign.start,
                      ))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Icon(Icons.pin_drop_outlined)],
              )
            ]),
      ),
    );
  }
}
