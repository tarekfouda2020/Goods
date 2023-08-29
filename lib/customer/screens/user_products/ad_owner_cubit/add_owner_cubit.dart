import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:heraggoods/customer/models/AdOwnerModel.dart';

part 'add_owner_state.dart';

class AddOwnerCubit extends Cubit<AddOwnerState> {
  AddOwnerCubit() : super(const AddOwnerInitial());

  onDataUpdated(AdOwnerModel model){
    emit(AddOwnerUpdated(model, !state.changed));
  }

  onUpdateRate(bool showRate)async{
    state.model!.showRate=showRate;
    onDataUpdated(state.model!);
  }

  onUpdateFollow(bool follow){
    state.model!.showFollow=follow;
    onDataUpdated(state.model!);
  }

}
