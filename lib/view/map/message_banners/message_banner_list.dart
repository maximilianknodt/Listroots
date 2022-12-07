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
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        child: BlocBuilder<MapMessagingBloc, MapMessagingState>(
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: state.messages.length,
              separatorBuilder: (_, __) => Divider(color: Colors.transparent),
              itemBuilder: (context, index) {
                final message = state.messages[index];
                return OverlayedMessageBanner(
                  leading: message.type.icon,
                  isStationary: message.isStationary,
                  onPressed: message.onPressed,
                  child: Text(message.title),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
