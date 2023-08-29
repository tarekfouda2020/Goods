import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:heraggoods/general/utilities/moor_db/db.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit() : super(BrandsInitial());

  onUpdateBrands(List<Category> brands,int parentId){
    emit(BrandsUpdateState(brands,parentId, !state.changed));
  }

}
