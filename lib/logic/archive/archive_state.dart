part of 'archive_bloc.dart';

abstract class ArchiveState {
  final bool _uploaded;
  ArchiveState(this._uploaded);

  bool get uploaded;
}

class UploadState extends ArchiveState {
  UploadState(uploaded) : super(uploaded);

  @override
  bool get uploaded => _uploaded;
}
