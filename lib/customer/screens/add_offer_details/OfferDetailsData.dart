// ignore_for_file: file_names, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls

part of 'OfferDetailsImports.dart';

class OfferDetailsData {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController file = TextEditingController();
  final GlobalKey<DropdownSearchState<Category>> dept = GlobalKey();
  // final GlobalKey<DropdownSearchState<Category>> supDept =    GlobalKey();
  final CatsInputsCubit catsInputsCubit = CatsInputsCubit();
  final HeaderCubit headerCubit = HeaderCubit();
  final GroupCubit groupCubit = GroupCubit();
  final DescCubit descCubit = DescCubit();
  final AdsPhoneCubit adsPhoneCubit = AdsPhoneCubit();
  final GenericCubit<File?> fileCubit = GenericCubit(null);
  String? catId;
  String? lastCat;

  List<DropDownModel> get replyOptions => [
        DropDownModel(name: "نعم", id: 1, selected: false),
        DropDownModel(name: "لا", id: 0, selected: false),
      ];

  DropDownModel reply = DropDownModel(name: "نعم", id: 1, selected: false);

  void setDeptChanged(Category model, BuildContext context) async {
    clearChildrenData();
    catsInputsCubit.onCatsInputClear();
    if (model != null) {
      catId = model.id.toString();
      // model.list.forEach((element) {
      //   element.selected=false;
      // });
      getPropertiesList(context);
      var children =
          await context.read<MyDatabase>().selectChildrenCatsAsync(model.id!);
      if (children.isNotEmpty) {
        catsInputsCubit.onCatsInputsUpdated(List.from([model]));
      } else {
        lastCat = model.id.toString();
      }
    }
  }

  void setChangeReplyOption(DropDownModel model) {
    reply = model;
  }

  void setCatChanged(Category model, int index, BuildContext context) async {
    catsInputsCubit.onCatsInputClearAbove(index + 1);
    if (model != null) {
      catId = model.id.toString();
      var children =
          await context.read<MyDatabase>().selectChildrenCatsAsync(model.id!);
      if (children.isNotEmpty) {
        catsInputsCubit.onCatsInputAdded(model);
      } else {
        lastCat = model.id.toString();
      }
    }
  }

  void getPropertiesList(BuildContext context) async {
    List<SpecificationHeaderModel> data =
        await CustomerRepository(context).getOffersPropertyData(catId!);
    headerCubit.onHeaderUpdated(data);
  }

  void clearChildrenData() async {
    // supDept.currentState?.changeSelectedItem(null);
    headerCubit.onHeaderUpdated([]);
    groupCubit.onGroupUpdated([]);
    descCubit.onDescListChanged([]);
  }

  void selectSpecificHeader(
      int selected, int index, SpecificationGroupModel model) {
    var headers = headerCubit.state.headers;
    groupCubit.state.specifications
        .removeWhere((element) => headers[index].groupList.contains(element));
    headers[index].selectedId = selected;
    groupCubit.state.specifications.add(model);
    groupCubit.onGroupUpdated(groupCubit.state.specifications);
    //// groupCubit.onGroupUpdated(model.specificationsList);
    List<CatPropertyModel> props = descCubit.state.descriptions!;
    //// props.removeWhere((element) =>element.header==headers[index].id||element.type!=0);
    props.removeWhere((element) => element.header == headers[index].id);
    props.add(CatPropertyModel(
        title: headers[index].title,
        value: model.name,
        type: 0,
        header: headers[index].id));
    headers[index].groupList.forEach((element) {
      element.selectedId = null;
      element.specificationsList.forEach((item) {
        item.selectedId = null;
        item.value = 0;
      });
    });
    headerCubit.onHeaderUpdated(headers);
    descCubit.onDescListChanged(props);
  }

  void selectSpecificGroup(
      int selected, int index, PropertyModel model, int groupIndex) {
    var groups = groupCubit.state.specifications;
    groups[index].specificationsList[groupIndex].selectedId = selected;
    groupCubit.onGroupUpdated(groups);
    List<CatPropertyModel> props = descCubit.state.descriptions!;
    var exist = props
        .where((element) =>
            element.title == groups[index].specificationsList[groupIndex].name)
        .toList();
    if (exist.isNotEmpty) {
      props.remove(exist.first);
    }
    props.add(CatPropertyModel(
        title: groups[index].specificationsList[groupIndex].name,
        value: model.name,
        type: groups[index].specificationsList[groupIndex].type));
    descCubit.onDescListChanged(props);
  }

  void changePropSlider(double value, int index, int groupIndex) {
    var groups = groupCubit.state.specifications;
    groups[index].specificationsList[groupIndex].value = value.toInt();
    groupCubit.onGroupUpdated(groups);
    List<CatPropertyModel> props = descCubit.state.descriptions!;
    var exist = props
        .where((element) =>
            element.title == groups[index].specificationsList[groupIndex].name)
        .toList();
    if (exist.isNotEmpty) {
      props.remove(exist.first);
    }
    props.add(CatPropertyModel(
        title: groups[index].specificationsList[groupIndex].name,
        value: value.toString(),
        type: groups[index].specificationsList[groupIndex].type));
    descCubit.onDescListChanged(props);
  }

  void selectDropDownProp(int index, PropertyModel model, int groupIndex) {
    var groups = groupCubit.state.specifications;
    List<CatPropertyModel> props = descCubit.state.descriptions!;
    var exist = props
        .where((element) =>
            element.title == groups[index].specificationsList[groupIndex].name)
        .toList();
    if (exist.isNotEmpty) {
      props.remove(exist.first);
    }
    if (model != null) {
      var groups = groupCubit.state.specifications;
      groups[index].specificationsList[groupIndex].selectedId = model.id;
      groupCubit.onGroupUpdated(groups);
      props.add(CatPropertyModel(
          title: groups[index].specificationsList[groupIndex].name,
          value: model.name,
          type: groups[index].specificationsList[groupIndex].type));
      descCubit.onDescListChanged(props);
    } else {
      descCubit.onDescListChanged(props);
    }
  }

  void changePhoneState(value) {
    adsPhoneCubit.onUpdatePhone(showPhone: value);
  }

  void changePriceState(value) {
    adsPhoneCubit.onUpdatePrice(showPrice: value);
  }

  void setFileVideo() async {
    var video = await Utils.getVideo();
    if (video != null) {
      fileCubit.onUpdateData(video);
    }
  }

  void setAddOffer(BuildContext context, AddAdsModel model) {
    String? valid = Validator().validatePhone(value: phone.text);
    if (valid != null && adsPhoneCubit.state.showPhone) {
      LoadingDialog.showSimpleToast("قم بادخال رقم الجوال");
      return;
    }
    if (title.text.isEmpty) {
      LoadingDialog.showSimpleToast("قم بادخال عنوان للإعلان");
      return;
    }
    if (price.text.isEmpty && adsPhoneCubit.state.showPrice) {
      LoadingDialog.showSimpleToast("قم بادخال سعر للإعلان");
      return;
    }
    if (lastCat == null) {
      LoadingDialog.showSimpleToast("ادخل القسم التابع للإعلان");
      return;
    }
    List<String> props = descCubit.state.descriptions!
        .map((e) => "${e.title} ${e.value}")
        .toList();
    model.title = title.text;
    model.fkCat = lastCat;
    model.phone = phone.text;
    model.price = price.text;
    model.fromAppOrNo = true.toString();
    model.showPhone = (adsPhoneCubit.state.showPhone).toString();
    model.determinePrice = (adsPhoneCubit.state.showPrice).toString();
    model.lang = context.read<LangBloc>().state.lang;
    model.description = json.encode(props);
    model.notes = desc.text;
    model.closeReply = (reply.id != 1);
    model.video = fileCubit.state.data;

    // debugPrint(model.toJson());
    CustomerRepository(context).setAddOffer(model).then((value) {
      if (value) {
        AutoRouter.of(context).push(const AddOfferSuccessRoute());
      }
    });
  }
}
