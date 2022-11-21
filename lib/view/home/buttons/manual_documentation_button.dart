import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'record_button_base.dart';

class ManualDocumentationButton extends RecordButtonBase {
  const ManualDocumentationButton({super.key})
      : super(
          title: "Manuelle\nDokumentation",
          icon: Icons.linked_camera_outlined,
        );

  @override
  Widget build(BuildContext context) => super.build(context);

  @override
  Color backgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }

  @override
  Color foregroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  @override
  Color? borderColor(BuildContext context) {
    return Theme.of(context).colorScheme.primaryContainer;
  }

  @override
  void onPressed(BuildContext context) {
    GoRouter.of(context).push('/documenting');
  }
}
