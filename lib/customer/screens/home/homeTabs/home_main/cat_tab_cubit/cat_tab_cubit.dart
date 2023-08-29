import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_tab_state.dart';

class CatTabCubit extends Cubit<CatTabState> {
  CatTabCubit() : super(const CatTabInitial());


  onUpdateCatsTab(int id){
    emit(CatTabUpdated(id: id,changed: !state.changed));
  }


  // Future<List<Category>> fetchData(int parentId,BuildContext context)async{
  //   var data =await context.read<MyDatabase>().selectChildrenCatsAsync(parentId);
  //   var exist= data.where((element) => element.id==0).toList();
  //   if(data.length>0&&exist.length==0){
  //     data.insert(0, Category(id: 0, name: "الكل", img: "", parentId: parentId, selected: true, showSideManu: false));
  //   }
  //   onUpdateCatsTab(data);
  //   return state.cats;
  // }
  //
  // onSelectTabCat(int index,Category model){
  //   Category selected = state.cats.where((element) => element.selected).first;
  //   int selectedIndex = state.cats.indexOf(selected);
  //   selected=Category(id: selected.id, name: selected.name, img: selected.img, parentId: selected.parentId, selected: false, showSideManu: selected.showSideManu);
  //   state.cats[selectedIndex]=selected;
  //   state.cats[index]=Category(id: model.id, name: model.name, img: model.img, parentId: model.parentId, selected: true, showSideManu: model.showSideManu);
  //   onUpdateCatsTab(state.cats);
  // }


}
