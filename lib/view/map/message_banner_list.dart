import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listroots/logic/auth/auth_bloc.dart';

import 'overlayed_message_banner.dart';

class MessageBannerList extends StatelessWidget {
  const MessageBannerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(20), // TODO: theme extension
          child: Column(
            children: [
              if (state is! Authenticated) ...[
                OverlayedMessageBanner(
                  leading: Icon(Icons.error_outline),
                  isStationary: true,
                  onPressed: () =>
                      BlocProvider.of<AuthBloc>(context).add(AuthEventVerify()),
                  child: Text("Du bist nicht bei OSM eingeloggt!"),
                ),
                const Divider(color: Colors.transparent)
              ],
              // TODO: state management
              OverlayedMessageBanner(
                leading: const Icon(Icons.error_outline),
                isStationary: false,
                child: const Text("Lade Fahrbahnschäden von der Datenbank."),
              ),
              const Divider(color: Colors.transparent),
            ],
          ),
        );
      },
    );
  }
}
