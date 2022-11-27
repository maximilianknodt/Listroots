import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/map/messaging/map_messaging_bloc.dart';
import 'overlayed_message_banner.dart';

class MessageBannerList extends StatelessWidget {
  const MessageBannerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: BlocBuilder<MapMessagingBloc, MapMessagingState>(
        builder: (context, state) {
          log('MessageBannerList: ${state.messages.map((e) => e.title)}');
          return Column(
            children: state.messages.map((message) {
              return OverlayedMessageBanner(
                leading: message.type.icon,
                isStationary: message.isStationary,
                onPressed: message.onPressed,
                child: Text(message.title),
              );
              //const Divider(color: Colors.transparent),]
            }).toList(),
          );
        },
      ),
    );
  }
}
