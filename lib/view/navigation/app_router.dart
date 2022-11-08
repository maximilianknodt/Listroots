import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/navigation/bottom_navigation_destination.dart';
import '../archive/archive.dart';
import '../drive/drive.dart';
import '../home/home.dart';
import '../main_scaffold.dart';
import '../map/map.dart';

class AppRouter extends GoRouter {
  AppRouter({required List<BottomNavigationDestination> destinations})
      : super(
          initialLocation: '/home',
          routes: [
            // Bottom Navigation Routes (Home, Drive, Map, Archive)
            ShellRoute(
              builder: (_, __, child) => MainScaffold(child: child),
              routes: destinations
                  .map((element) => GoRoute(
                        path: element.route,
                        builder: (_, __) {
                          return _bottomNavElementWidget(element.route);
                        },
                      ))
                  .toList(),
            ),
          ],
        );

  static Widget _bottomNavElementWidget(String route) {
    switch (route) {
      case '/drive':
        return const Drive();
      case '/map':
        return const Map();
      case '/archive':
        return const Archive();
    }
    return const Home();
  }
}
