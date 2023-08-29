part of 'brands_cubit.dart';

abstract class BrandsState extends Equatable {
  final List<Category> brands;
  final int parentId;
  final bool changed;
  const BrandsState(this.brands,this.parentId,this.changed);
}

class BrandsInitial extends BrandsState {
  BrandsInitial() : super([], 0,false);

  @override
  List<Object> get props => [brands,changed,parentId];
}
class BrandsUpdateState extends BrandsState {
  const BrandsUpdateState(List<Category> brands,int parentId, bool changed) : super(brands, parentId, changed);

  @override
  List<Object> get props => [brands,changed,parentId];
}
