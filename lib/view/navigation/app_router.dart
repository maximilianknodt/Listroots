import 'package:go_router/go_router.dart';

import '../../data/navigation/bottom_navigation_destination.dart';
import '../main_scaffold.dart';

class AppRouter extends GoRouter {
  AppRouter({required List<BottomNavigationDestination> destinations})
      : super(
          initialLocation: '/home',
          routes: [
            // Bottom Navigation Routes (Home, Drive, Map, Archive)
            ShellRoute(
              builder: (_, __, child) => MainScaffold(child: child),
              routes: destinations.map((element) {
                return GoRoute(
                  path: element.route,
                  builder: (context, __) => element.destination(context),
                );
              }).toList(),
            ),
          ],
        );
}
