part of 'gps_bloc.dart';

@immutable
abstract class GpsState {
  final LocationPermission? permission;

  GpsState(this.permission);
}

class GpsInitial extends GpsState {
  GpsInitial() : super(null);
}

class GpsLoading extends GpsState {
  GpsLoading() : super(null);
}

class GpsLocation extends GpsState {
  final LatLng location;

  GpsLocation({
    required this.location,
    LocationPermission? permission,
  }) : super(permission);
}

class GpsDenied extends GpsState {
  GpsDenied({
    required LocationPermission permission,
  }) : super(permission);
}

class GpsError extends GpsState {
  final String message;

  GpsError({
    required this.message,
    LocationPermission? permission,
  }) : super(permission);
}
