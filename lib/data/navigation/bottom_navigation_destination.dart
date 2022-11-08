import 'package:flutter/widgets.dart';

class BottomNavigationDestination {
  const BottomNavigationDestination({
    required this.icon,
    required this.label,
    required this.route,
  });

  final IconData icon;
  final String label;
  final String route;
}
