part of 'archive_bloc.dart';

abstract class ArchiveEvent {}

class ChangeUploadStateEvent extends ArchiveEvent {
  ChangeUploadStateEvent(this.context, this.uploaded);

  final BuildContext context;
  final bool uploaded;
}
