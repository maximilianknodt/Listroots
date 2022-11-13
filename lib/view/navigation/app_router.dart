import 'package:go_router/go_router.dart';

import '../../data/navigation/bottom_navigation_destination.dart';
import '../main_scaffold.dart';
import 'fade_page.dart';

class AppRouter extends GoRouter {
  AppRouter({required List<BottomNavigationDestination> destinations})
      : super(
          initialLocation: destinations.first.route,
          routes: [
            // Bottom Navigation Routes (Home, Drive, Map, Archive)
            ...destinations.map((element) {
              return GoRoute(
                path: element.route,
                builder: (context, state) => element.destination(context),
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: MainScaffold(child: element.destination(context)),
                ),
              );
            }).toList(),
          ],
        );
}
