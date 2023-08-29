import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:heraggoods/customer/models/Dtos/CatPropertyModel.dart';

part 'desc_state.dart';

class DescCubit extends Cubit<DescState> {
  DescCubit() : super(DescInitial(changed: false));

  onDescListChanged(List<CatPropertyModel> props){
    emit(DescUpdated(descriptions: props,changed: !state.changed!));
  }

}
