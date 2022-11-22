import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'record_button_base.dart';

class ContinousRecordingButton extends RecordButtonBase {
  const ContinousRecordingButton({super.key})
      : super(
          title: "Kontinuierliche\nAufzeichnung",
          icon: Icons.videocam_outlined,
        );

  @override
  Widget build(BuildContext context) => super.build(context);

  @override
  Color backgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.tertiary;
  }

  @override
  Color foregroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.onPrimary;
  }

  @override
  void onPressed(BuildContext context) {
    GoRouter.of(context).push('/recording');
  }
}
