import 'package:flutter/widgets.dart';

typedef ActionBuilder = Widget Function(BuildContext context);
typedef DestinationBuilder = Widget Function(BuildContext context);

class BottomNavigationDestination {
  const BottomNavigationDestination({
    required this.icon,
    required this.label,
    required this.route,
    required this.destination,
    this.action,
  });

  final IconData icon;
  final String label;
  final String route;
  final DestinationBuilder destination;
  final ActionBuilder? action;
}
