import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
 import 'package:heraggoods/general/utilities/moor_db/db.dart';

part 'cats_inputs_state.dart';

class CatsInputsCubit extends Cubit<CatsInputsState> {
  CatsInputsCubit() : super(CatsInputsInitial(changed: false));

  onCatsInputsUpdated(List<Category> cats){
    emit(CatsInputsUpdated(cats: cats,changed: !state.changed));
  }

  onCatsInputAdded(Category cat){
    state.cats.add(cat);
    emit(CatsInputsUpdated(cats: state.cats,changed: !state.changed));
  }

  onCatsInputClear(){
    emit(CatsInputsInitial(changed: !state.changed));
  }

  onCatsInputClearAbove(int index){
    if(index<state.cats.length){
      state.cats.removeRange(index,state.cats.length);
      emit(CatsInputsUpdated(cats: state.cats,changed: !state.changed));
    }
  }


}
