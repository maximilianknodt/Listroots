import 'package:flutter/material.dart';

class SensorMeter extends StatelessWidget {
  const SensorMeter({
    super.key,
    this.rash = 0.0,
  }) : assert(rash >= 0.0 && rash <= 1.0);

  final double rash;
  final double height = 3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: height,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        FractionallySizedBox(
          widthFactor: rash,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: height,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
