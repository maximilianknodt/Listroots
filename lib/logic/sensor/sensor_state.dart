part of 'sensor_bloc.dart';

@immutable
abstract class SensorState {}

class SensorInitial extends SensorState {}

class SensorRecording extends SensorState {
  final List<UserAccelerometerEvent> accelerometerEvents;
  final List<GyroscopeEvent> gyroscopeEvents;
  final List<DateTime> timestamps;

  SensorRecording({
    required this.accelerometerEvents,
    required this.gyroscopeEvents,
    required this.timestamps,
  });

  List<double> get normalizedAccelerometerSums {
    return _normalize(accelerometerEvents.map((e) => e.x + e.y + e.z));
  }

  List<double> get normalizedGyroscopeSums {
    return _normalize(gyroscopeEvents.map((e) => e.x + e.y + e.z));
  }

  List<double> _normalize(Iterable<double> values) {
    if (values.isEmpty) return [];
    if (values.length == 1) return [1];
    double max = values.reduce((curr, next) => curr > next ? curr : next);
    double min = values.reduce((curr, next) => curr < next ? curr : next);
    double range = max - min;
    return values.map((e) => e / range).toList();
  }
}

class SensorPaused extends SensorRecording {
  SensorPaused(SensorRecording recording)
      : super(
          accelerometerEvents: recording.accelerometerEvents,
          gyroscopeEvents: recording.gyroscopeEvents,
          timestamps: recording.timestamps,
        );

  SensorPaused.of({
    required super.accelerometerEvents,
    required super.gyroscopeEvents,
    required super.timestamps,
  });
}
