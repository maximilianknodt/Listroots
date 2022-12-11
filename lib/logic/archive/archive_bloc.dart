import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'archive_event.dart';
part 'archive_state.dart';

class ArchiveBloc extends Bloc<ArchiveEvent, ArchiveState> {
  ArchiveBloc() : super(UploadState(false)) {
    on<ArchiveEvent>((event, emit) {});
    on<ChangeUploadStateEvent>((event, emit) {
      emit(UploadState(!event.uploaded));
    });
  }
}
