part of 'map_reply_cubit.dart';

abstract class MapReplyState extends Equatable {
  final bool showMap;
  final bool closeReply;
  const MapReplyState({required this.showMap, required this.closeReply});
}

class MapReplyInitial extends MapReplyState {
  const MapReplyInitial():super(closeReply: false,showMap: true);
  @override
  List<Object> get props => [closeReply,showMap];
}

class MapReplyUpdated extends MapReplyState {
  const MapReplyUpdated({required bool showMap, required bool closeReply}):super(closeReply: closeReply,showMap: showMap);
  @override
  List<Object> get props => [closeReply,showMap];
}
