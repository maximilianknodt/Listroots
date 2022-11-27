import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BannerMessage {
  final Key key;
  final BannerMessageType type;
  final String title;
  final bool isStationary;
  final Function()? onPressed;

  BannerMessage({
    Key? key,
    this.type = BannerMessageType.info,
    required this.title,
    this.isStationary = false,
    this.onPressed,
  }) : key = key ?? ValueKey(UniqueKey());
}

enum BannerMessageType {
  error,
  warning,
  info,
  success,
  loading;

  Widget get icon {
    switch (this) {
      case BannerMessageType.error:
        return const Icon(Icons.error_outline);
      case BannerMessageType.warning:
        return const Icon(Icons.warning_outlined);
      case BannerMessageType.info:
        return const Icon(Icons.info_outline);
      case BannerMessageType.success:
        return const Icon(Icons.check_circle_outline);
      case BannerMessageType.loading:
        return const CircularProgressIndicator(); // TODO: loading widget
    }
  }
}
