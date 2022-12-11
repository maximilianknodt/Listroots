import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitial()) {
    on<PhotoEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Analyze>(_analyse);
  }

  void _analyse(Analyze event, Emitter<PhotoState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(PhotoAnalysisFinished());
  }
}
