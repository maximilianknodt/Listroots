import 'package:flutter/material.dart';

import 'overlayed_message_banner.dart';

class MessageBannerList extends StatelessWidget {
  const MessageBannerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20), // TODO: theme extension
      child: Column(
        children: [
          // TODO: state management
          OverlayedMessageBanner(
            leading: Icon(Icons.error_outline),
            isStationary: true,
            onPressed: () {},
            child: Text("Du bist nicht bei OSM eingeloggt!"),
          ),
          const Divider(color: Colors.transparent),
          OverlayedMessageBanner(
            leading: const Icon(Icons.error_outline),
            isStationary: false,
            child: const Text("Lade Fahrbahnschäden von der Datenbank."),
          ),
          const Divider(color: Colors.transparent),
        ],
      ),
    );
  }
}
