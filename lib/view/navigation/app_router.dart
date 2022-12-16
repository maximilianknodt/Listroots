import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/auth/client.dart';
import '../../data/navigation/bottom_navigation_destination.dart';
import '../../logic/navigation/navigation_bloc_bloc.dart';
import '../../main.dart';
import '../drive/documenting/documenting.dart';
import '../drive/documenting/resultscreen.dart';
import '../drive/recording/active_drive_screen.dart';
import '../main_scaffold.dart';
import 'fade_page.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AppRouter extends GoRouter {
  AppRouter({required BuildContext context})
      : super(
          initialLocation: initialLocation(context),
          routes: _routes(context),
        );

  static List<RouteBase> _routes(BuildContext context) {
    return [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          if (isOauth2Redirect(state.queryParams)) {
            return '/oauth/${state.queryParams["code"]}';
          } else {
            initialLocation(context);
          }
        },
      ),

      GoRoute(
        path: '/oauth/:code',
        builder: (context, state) {
          String code = state.params["code"] ?? "";
          return OAuthScreen(code);
        },
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

  static String initialLocation(BuildContext context) {
    return (_navigationBloc(context).state as BottomNavigationState)
        .currentDestination
        .route;
  }

  static bool isOauth2Redirect(Map<String, String> queryParams) {
    return queryParams.keys.contains("code");
  }
}

// TODO: move to own file
class OAuthScreen extends StatefulWidget {
  const OAuthScreen(this.code, {super.key});

  final String code;

  @override
  State<OAuthScreen> createState() => _OAuthScreenState();
}

class _OAuthScreenState extends State<OAuthScreen> {
  Client? client;

  @override
  void initState() {
    super.initState();
    listener(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                AppLocalizations.of(context)!.oauthVerify,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }

  void listener(String code) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (grant != null) {
      log("code: $code", name: "OAuthScreen");
      var resClient = await grant!.handleAuthorizationResponse({"code": code});
      inspect(resClient);
      log(resClient.credentials.accessToken);
      setState(() => client = resClient);
      if (client != null) context.go(AppRouter.initialLocation(context));
    }
  }
}
