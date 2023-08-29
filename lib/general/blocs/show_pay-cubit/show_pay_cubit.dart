import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_pay_state.dart';

class ShowPayCubit extends Cubit<ShowPayState> {
  ShowPayCubit() : super(const ShowPayInitial());

  onUpdateShow(bool show){
    emit(ShowPayUpdate(show));
  }

}
