import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'logic/navigation/navigation_bloc_bloc.dart';
import 'theme.dart';
import 'view/home.dart';
import 'view/main_scaffold.dart';
import 'view/navigation/fade_page.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: AppColorTheme().theme,
        darkTheme: AppColorTheme().darkTheme,
        routerConfig: _router,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MainScaffold(child: child);
        },
        pageBuilder: (context, state, child) {
          // use a page with a custom fade transition
          return CustomTransitionPage(
            transitionsBuilder: (context, animation, _, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            key: state.pageKey,
            child: MainScaffold(child: child),
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => FadePage(child: Home()),
          ),
          GoRoute(
            path: '/drive',
            pageBuilder: (context, state) =>
                FadePage(child: Center(child: Text("drive"))),
          ),
          GoRoute(
            path: '/map',
            builder: (BuildContext context, GoRouterState state) {
              return const Center(child: Text('map'));
            },
          ),
          GoRoute(
            path: '/archive',
            builder: (BuildContext context, GoRouterState state) {
              return const Center(child: Text('archive'));
            },
          ),
        ],
      ),
    ],
  );
}
