import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'map_reply_state.dart';

class MapReplyCubit extends Cubit<MapReplyState> {
  MapReplyCubit() : super(const MapReplyInitial());

  onInitData(bool map,bool reply){
    emit(MapReplyUpdated(showMap: map,closeReply: reply));
  }

  onMapChanged(){
    emit(MapReplyUpdated(showMap: !state.showMap,closeReply: state.closeReply));
  }

  onReplyChanged(){
    emit(MapReplyUpdated(showMap: state.showMap,closeReply: !state.closeReply));
  }

}
