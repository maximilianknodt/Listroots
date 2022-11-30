import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/sensor/sensor_bloc.dart';

class SensorMeter extends StatelessWidget {
  const SensorMeter({super.key});

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
        BlocBuilder<SensorBloc, SensorState>(
          builder: (context, state) {
            if (state is SensorRecording) {
              final accSums = state.normalizedAccelerometerSums;
              final gyroSums = state.normalizedGyroscopeSums;
              double acc = accSums.isEmpty ? 0 : accSums.last;
              double gyro = gyroSums.isEmpty ? 0 : gyroSums.last;
              double ratio = ((acc + gyro) / 2).abs().toDouble();
              ratio = ratio.clamp(0.0001, 1);

              return FractionallySizedBox(
                widthFactor: ratio,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: height,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
