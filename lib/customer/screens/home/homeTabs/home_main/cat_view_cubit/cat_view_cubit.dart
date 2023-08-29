import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:heraggoods/customer/models/Dtos/CategoryChildModel.dart';
import 'package:heraggoods/general/utilities/moor_db/db.dart';

part 'cat_view_state.dart';

class CatViewCubit extends Cubit<CatViewState> {
  CatViewCubit() : super(CatViewInitial());

  void onUpdateCatRows(List<CategoryChildModel> cats) {
    emit(CatViewUpdateState(catRows: cats, changed: !state.changed));
  }

  void onAddCatRow(CategoryChildModel cat) {
    state.catRows.add(cat);
    emit(CatViewUpdateState(catRows: state.catRows, changed: !state.changed));
  }

  void onRemoveCatRow() {
    state.catRows.removeLast();
    emit(CatViewUpdateState(catRows: state.catRows, changed: !state.changed));
  }

  void updateSelectedCat(int parentId, int index) {
    CategoryChildModel model =
        state.catRows.where((element) => parentId == parentId).first;
    int position = state.catRows.indexOf(model);
    List<Category> lst = model.cats;
    Category selected = lst.where((element) => element.selected).first;
    int selectedIndex = lst.indexOf(selected);
    selected = Category(
      id: selected.id,
      name: selected.name,
      img: selected.img,
      parentId: selected.parentId,
      selected: false,
      showSideManu: selected.showSideManu,
      idU: 0,
    );
    lst[selectedIndex] = selected;
    lst[index] = Category(
      id: lst[index].id,
      name: lst[index].name,
      img: lst[index].img,
      parentId: lst[index].parentId,
      selected: true,
      showSideManu: lst[index].showSideManu,
      idU: 0,
    );
    model.cats = lst;
    state.catRows[position] = model;
    onUpdateCatRows(state.catRows);
  }
}
