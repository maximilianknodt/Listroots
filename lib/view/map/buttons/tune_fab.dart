import 'package:flutter/material.dart';

class TuneFAB extends StatelessWidget {
  const TuneFAB({
    Key? key,
    bool isOpen = false,
    Function()? onPressed,
  })  : _isOpen = isOpen,
        _onPressed = onPressed,
        super(key: key);

  final bool _isOpen;
  final Function()? _onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onPressed,
      child: _isOpen
          ? const RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.chevron_right),
            )
          : const Icon(Icons.tune),
    );
  }
}
