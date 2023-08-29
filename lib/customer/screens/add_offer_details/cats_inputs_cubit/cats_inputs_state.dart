part of 'cats_inputs_cubit.dart';

abstract class CatsInputsState extends Equatable {
  final List<Category> cats;
  final bool changed;
  const CatsInputsState({required this.cats, required this.changed});
}

class CatsInputsInitial extends CatsInputsState {
  CatsInputsInitial({required bool changed})
      : super(cats: [], changed: changed);

  @override
  List<Object> get props => [cats, changed];
}

class CatsInputsUpdated extends CatsInputsState {
  const CatsInputsUpdated({required List<Category> cats, required bool changed})
      : super(cats: cats, changed: changed);

  @override
  List<Object> get props => [cats, changed];
}
