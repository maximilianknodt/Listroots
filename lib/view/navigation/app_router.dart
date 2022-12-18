import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/navigation/bottom_navigation_destination.dart';
import '../../logic/navigation/navigation_bloc_bloc.dart';
import '../drive/documenting/documenting.dart';
import '../drive/documenting/resultscreen.dart';
import '../drive/recording/active_drive_screen.dart';
import '../main_scaffold.dart';
import '../splash/splash.dart';
import 'fade_page.dart';

class AppRouter extends GoRouter {
  AppRouter({required BuildContext context})
      : super(
          initialLocation: _initialLocation(context),
          routes: _routes(context),
        );

  static List<RouteBase> _routes(BuildContext context) {
    return [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const Splash(),
      ),
      // Drive Routes
      GoRoute(
        path: '/recording',
        builder: (context, state) => const ActiveDriveScreen(),
      ),
      GoRoute(
        path: '/documenting',
        builder: (context, state) => const Documenting(),
      ),
      GoRoute(
        path: '/result',
        builder: (context, state) => Resultscreen(),
      ),

      // Bottom Navigation Routes (Home, Drive, Map, Archive)
      ..._destinations(context).map((element) {
        return GoRoute(
          path: element.route,
          builder: (context, state) => element.destination(context),
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            child: MainScaffold(
              action: element.action?.call(context),
              title: Text(element.label),
              child: element.destination(context),
            ),
          ),
        );
      }).toList(),
    ];
  }

  static NavigationBloc _navigationBloc(BuildContext context) =>
      BlocProvider.of<NavigationBloc>(context);

  static List<BottomNavigationDestination> _destinations(BuildContext context) {
    return _navigationBloc(context).state.destinations;
  }

  static String _initialLocation(BuildContext context) {
    return (_navigationBloc(context).state as BottomNavigationState)
        .currentDestination
        .route;
  }
}
