import 'package:flutter/material.dart';

class CurrentLocationMarkerDot extends StatefulWidget {
  const CurrentLocationMarkerDot({
    Key? key,
    required this.offset,
  }) : super(key: key);

  final Offset offset;

  @override
  State<CurrentLocationMarkerDot> createState() =>
      _CurrentLocationMarkerDotState();
}

class _CurrentLocationMarkerDotState extends State<CurrentLocationMarkerDot>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _controller;
  final double size = 26.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    final Animation<double> curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(curve);
    _controller.repeat(reverse: true);
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.offset.dx - size / 2,
      top: widget.offset.dy - size / 2,
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(3),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.background,
              width: 0,
              strokeAlign: StrokeAlign.inside,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent,
                blurRadius: _blurRadius,
                spreadRadius: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  double get _blurRadius => _animation.value * 30;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
