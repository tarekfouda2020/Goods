import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:heraggoods/general/models/CategoryModel.dart';

part 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit() : super(CatsInitial());


  onSetCatsData(List<CategoryModel> cats){
    emit(CatsUpdatedState(cats));
  }

  onSetSelectCategory(List<CategoryModel> lst){
    emit(CatsInitial());
    emit(CatsUpdatedState(lst));
  }

}
