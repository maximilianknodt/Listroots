part of 'map_messaging_bloc.dart';

@immutable
abstract class MapMessagingEvent {
  const MapMessagingEvent();
}

class AddMessage extends MapMessagingEvent {
  final BannerMessage message;
  const AddMessage(this.message);
}

class RemoveMessage extends MapMessagingEvent {
  final Key key;
  const RemoveMessage(this.key);
}
