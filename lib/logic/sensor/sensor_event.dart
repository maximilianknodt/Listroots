part of 'sensor_bloc.dart';

@immutable
abstract class SensorEvent {}

class SensorsStart extends SensorEvent {}

class SensorsStop extends SensorEvent {}

class SensorsReset extends SensorEvent {}

class SensorsUpdate extends SensorEvent {
  final UserAccelerometerEvent? accelerometerEvent;
  final GyroscopeEvent? gyroscopeEvent;
  final DateTime? timestamp;

  SensorsUpdate({
    this.accelerometerEvent,
    this.gyroscopeEvent,
    this.timestamp,
  });
}
