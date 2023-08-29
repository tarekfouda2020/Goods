part of 'cats_cubit.dart';

abstract class CatsState extends Equatable {
  final List<CategoryModel> cats;
  const CatsState(this.cats);
  @override
  List<Object> get props => [cats];
}

class CatsInitial extends CatsState {
  CatsInitial() : super([]);
  @override
  List<Object> get props => [cats];
}

class CatsUpdatedState extends CatsState {

  const CatsUpdatedState(List<CategoryModel> cats) : super(cats);

  @override
  List<Object> get props => [cats];
}

