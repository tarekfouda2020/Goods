part of 'product_details_cubit.dart';

abstract class ProductDetailsState extends Equatable {
  final AdsDetailsModel? model;
  final bool change;
  const ProductDetailsState({required this.model, required this.change});
}

class ProductDetailsInitial extends ProductDetailsState {
  const ProductDetailsInitial() : super(model: null,change: false);

  @override
  List<Object> get props => [model!,change];
}

class ProductDetailsUpdated extends ProductDetailsState {
  const ProductDetailsUpdated(AdsDetailsModel model,bool change) : super(model: model,change: change);

  @override
  List<Object> get props => [model!,change];
}


