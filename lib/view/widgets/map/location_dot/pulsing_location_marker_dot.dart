import 'package:flutter/material.dart';

class PulsingLocationMarkerDot extends StatefulWidget {
  const PulsingLocationMarkerDot({
    Key? key,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  final Color? color;
  final Color? backgroundColor;

  @override
  State<PulsingLocationMarkerDot> createState() =>
      _PulsingLocationMarkerDotState();
}

class _PulsingLocationMarkerDotState extends State<PulsingLocationMarkerDot>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _controller;
  final double size = 30.0;
  final double edgePercentage = 0.1;
  final int animationDuration = 1750;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration),
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

  double get _blurRadius => _animation.value * size;
  double get _edgeInsets => _animation.value * size * edgePercentage + 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ??
            Theme.of(context).colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(_edgeInsets),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.color ?? Colors.blue,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent,
              blurRadius: _blurRadius,
              spreadRadius: 0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
