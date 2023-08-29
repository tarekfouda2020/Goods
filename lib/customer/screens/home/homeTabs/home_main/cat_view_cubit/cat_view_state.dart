part of 'cat_view_cubit.dart';

abstract class CatViewState extends Equatable {
  final List<CategoryChildModel> catRows;
  final bool changed;
  const CatViewState({required this.catRows, required this.changed});
  @override
   List<Object> get props => [catRows];
}

class CatViewInitial extends CatViewState {
  CatViewInitial() : super(catRows: [],changed: false);

  @override
  List<Object> get props => [catRows,changed];
}

class CatViewUpdateState extends CatViewState {
  const CatViewUpdateState({required List<CategoryChildModel> catRows, required bool changed}) : super(catRows: catRows,changed: changed);

  @override
  List<Object> get props => [catRows,changed];
}


