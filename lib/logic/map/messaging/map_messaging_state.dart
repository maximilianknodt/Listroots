part of 'map_messaging_bloc.dart';

@immutable
abstract class MapMessagingState {
  final List<BannerMessage> messages;

  const MapMessagingState(this.messages);
}

class MapMessagingInitial extends MapMessagingState {
  const MapMessagingInitial() : super(const []);
}

class MapMessagingLoaded extends MapMessagingState {
  const MapMessagingLoaded(super.messages);
}
