 import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_views_state.dart';

class ProductViewsCubit extends Cubit<ProductViewsState> {
  ProductViewsCubit() : super(const ProductViewsInitial());

  setChangeView({ required bool showGrid}){
    emit(ProductViewsChanged(showGrid));
  }
}
