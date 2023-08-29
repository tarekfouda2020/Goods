part of 'cat_tab_cubit.dart';

abstract class CatTabState extends Equatable {
  final int id;
  final bool changed;
  const CatTabState({required this.id, required this.changed});
}

class CatTabInitial extends CatTabState {
  const CatTabInitial():super(id: 0,changed: false);
  @override
  List<Object> get props => [changed,id];
}

class CatTabUpdated extends CatTabState {
  const CatTabUpdated({required int id, required bool changed}):super(id: id ,changed: changed);
  @override
  List<Object> get props => [changed,id];
}
