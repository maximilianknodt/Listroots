part of 'gps_bloc.dart';

@immutable
abstract class GpsEvent {
  const GpsEvent();
}

class InitGpsStream extends GpsEvent {}

class StopGpsStream extends GpsEvent {}

class GpsPositionChanged extends GpsEvent {
  final LatLng location;

  const GpsPositionChanged(this.location);
}
