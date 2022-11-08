import 'package:go_router/go_router.dart';

import '../../data/navigation/bottom_navigation_destination.dart';
import '../archive/archive.dart';
import '../drive/drive.dart';
import '../home/home.dart';
import '../main_scaffold.dart';
import '../map/map.dart';
import 'fade_page.dart';

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
                        pageBuilder: (_, __) {
                          switch (element.route) {
                            case '/drive':
                              return FadePage(child: const Drive());
                            case '/map':
                              return FadePage(child: const Map());
                            case '/archive':
                              return FadePage(child: const Archive());
                          }
                          return FadePage(child: const Home());
                        },
                      ))
                  .toList(),
            ),
          ],
        );
}
