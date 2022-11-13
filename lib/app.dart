import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global_bloc_provider.dart';
import 'logic/navigation/navigation_bloc_bloc.dart';
import 'theme.dart';
import 'view/navigation/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalBlocProvider(
      child: _ListrootsApp(),
    );
  }
}

class _ListrootsApp extends StatelessWidget {
  const _ListrootsApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Listroots',
      theme: AppColorTheme().theme,
      darkTheme: AppColorTheme().darkTheme,
      routerConfig: AppRouter(context: context),
    );
  }
}
