import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drive_event.dart';
part 'drive_state.dart';

class DriveBloc extends Bloc<DriveEvent, DriveState> {
  DriveBloc() : super(DriveInitial()) {
    on<DriveEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
