import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'sensor_event.dart';
part 'sensor_state.dart';

class SensorBloc extends Bloc<SensorEvent, SensorState> {
  StreamSubscription? _accelerometerSubscription;
  StreamSubscription? _gyroscopeSubscription;

  SensorBloc() : super(SensorInitial()) {
    on<SensorsStart>((_, __) => _startSensorRecording());
    on<SensorsUpdate>((event, emit) => emit(_updateSensorRecording(event)));
    on<SensorsReset>(_onSensorsReset);
    on<SensorsStop>(_onSensorsStop);
  }

  FutureOr<void> _onSensorsReset(_, emit) {
    _cancelSubscriptions();
    emit(SensorInitial());
  }

  FutureOr<void> _onSensorsStop(event, emit) {
    _cancelSubscriptions();
    if (state is SensorRecording) {
      emit(SensorPaused(state as SensorRecording));
    } else {
      emit(SensorInitial());
    }
  }

  void _cancelSubscriptions() {
    _accelerometerSubscription?.cancel();
    _gyroscopeSubscription?.cancel();
  }

  void _startSensorRecording() async {
    if (Platform.isIOS && !await Permission.sensors.request().isGranted) {
      PermissionStatus status = await Permission.sensors.request();
      if (!status.isGranted) {
        add(SensorsReset());
        return;
      }
    }

    _accelerometerSubscription = userAccelerometerEvents.listen(
      (event) {
        try {
          add(SensorsUpdate(
            accelerometerEvent: event,
            timestamp: DateTime.now(),
          ));
        } on StateError catch (_) {
          _accelerometerSubscription?.cancel();
        }
      },
      onError: (e) => _accelerometerSubscription?.cancel(),
    );

    _gyroscopeSubscription = gyroscopeEvents.listen(
      (event) {
        try {
          add(SensorsUpdate(
            gyroscopeEvent: event,
            timestamp: DateTime.now(),
          ));
        } on StateError catch (_) {
          _gyroscopeSubscription?.cancel();
        }
      },
      onError: (e) => _gyroscopeSubscription?.cancel(),
    );
  }

  SensorRecording _updateSensorRecording(SensorsUpdate event) {
    if (state is SensorRecording) {
      final accelerometerEvents =
          (state as SensorRecording).accelerometerEvents;
      if (event.accelerometerEvent != null) {
        accelerometerEvents.add(event.accelerometerEvent!);
      }

      final gyroscopeEvents = (state as SensorRecording).gyroscopeEvents;
      if (event.gyroscopeEvent != null) {
        gyroscopeEvents.add(event.gyroscopeEvent!);
      }

      final timestamps = (state as SensorRecording).timestamps;
      if (event.timestamp != null) {
        timestamps.add(event.timestamp!);
      }

      return SensorRecording(
        accelerometerEvents: accelerometerEvents,
        gyroscopeEvents: gyroscopeEvents,
        timestamps: timestamps,
      );
    } else {
      return (SensorRecording(
        accelerometerEvents:
            event.accelerometerEvent != null ? [event.accelerometerEvent!] : [],
        gyroscopeEvents:
            event.gyroscopeEvent != null ? [event.gyroscopeEvent!] : [],
        timestamps: event.timestamp != null ? [event.timestamp!] : [],
      ));
    }
  }
}
