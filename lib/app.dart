import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:listroots/logic/auth/auth_bloc.dart';

import 'data/auth/client.dart';
import 'data/auth/oauth_main.dart';
import 'global_bloc_provider.dart';
import 'main.dart';
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

  void initialiseClient(BuildContext context) async {
    OAuthMain oauth = OAuthMain();
    bool credsExist = await oauth.credentialsExist();
    if (credsExist) {
      Client client = await oauth.loadClient();
      BlocProvider.of<AuthBloc>(context).add(AuthEventAtStart(client));
    }
  }

  @override
  Widget build(BuildContext context) {
    initialiseClient(context);
    return MaterialApp.router(
      title: 'Listroots',
      theme: AppColorTheme().theme,
      darkTheme: AppColorTheme().darkTheme,
      routerConfig: AppRouter(context: context),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('de', ''),
      ],
    );
  }
}
