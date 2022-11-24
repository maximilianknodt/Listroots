import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:meta/meta.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription<Position>? _positionStream;

  GpsBloc() : super(GpsInitial()) {
    on<InitGpsStream>(_initGpsStream);
    on<StopGpsStream>(_stopGpsStream);
    on<GpsPositionChanged>(_gpsPositionChanged);
  }

  void _gpsPositionChanged(GpsPositionChanged event, Emitter<GpsState> emit) {
    emit(GpsLocation(location: event.location));
  }

  Future<void> _initGpsStream(
    InitGpsStream event,
    Emitter<GpsState> emit,
  ) async {
    emit(GpsLoading());
    await _requestPermission(emit);

    if (state is GpsError || state is GpsDenied) {
      log('GPS can not be initialized');
      _positionStream = null;
      return;
    } else {
      log('GPS initialized');
      _positionStream = Geolocator.getPositionStream().listen(
        (e) => this.add(GpsPositionChanged(LatLng(e.latitude, e.longitude))),
        cancelOnError: true,
      );
    }
  }

  Future<void> _stopGpsStream(
    StopGpsStream event,
    Emitter<GpsState> emit,
  ) async {
    if (_positionStream != null) {
      _positionStream!.cancel();
    }
    emit(GpsInitial());
  }

  Future<void> _requestPermission(Emitter<GpsState> emit) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(GpsError(message: 'Location services are disabled.'));
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(GpsDenied(permission: permission));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(GpsDenied(permission: permission));
      return;
    }
  }
}
