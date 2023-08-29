import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notify_count_state.dart';

class NotifyCountCubit extends Cubit<NotifyCountState> {
  NotifyCountCubit() : super(const NotifyCountInitial());

  onUpdateCount(int count){
    emit(NotifyCountUpdate(count));
  }

}
