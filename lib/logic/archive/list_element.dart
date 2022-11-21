import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  const ListElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "52° 14'271\" | 008° 16'291\"",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "13:42 Uhr, 40% Konfidenz",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start,
                  )
                ],
              ),
              Icon(Icons.place_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
