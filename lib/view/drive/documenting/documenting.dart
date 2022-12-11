import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:go_router/go_router.dart';

import '../../../logic/mode/photo/photo_bloc.dart';

class Documenting extends StatelessWidget {
  const Documenting({super.key});

  static const String _asset = "assets/images/road.png";

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhotoBloc, PhotoState>(
      listener: _listener,
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.manualDocumentation),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Image.asset(_asset),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 170),
                        child: Text(
                          AppLocalizations.of(context)!.analyseStreet,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _listener(context, state) {
    if (state is PhotoAnalysisFinished) {
      GoRouter.of(context).replace('/result');
    }
  }

  Future<bool> _onWillPop() {
    // TODO: Analyse is running, ask user if he wants to cancel
    return Future.value(false);
  }
}
