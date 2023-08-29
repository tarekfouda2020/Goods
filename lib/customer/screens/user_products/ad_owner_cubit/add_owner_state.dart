part of 'add_owner_cubit.dart';

abstract class AddOwnerState extends Equatable {
  final AdOwnerModel? model;
  final bool changed;
  const AddOwnerState(this.model,this.changed);
}

class AddOwnerInitial extends AddOwnerState {
  const AddOwnerInitial() : super(null, false);

  @override
  List<Object> get props => [model!,changed];
}

class AddOwnerUpdated extends AddOwnerState {
  const AddOwnerUpdated(AdOwnerModel model, bool changed) : super(model, changed);

  @override
  List<Object> get props => [model!,changed];
}
