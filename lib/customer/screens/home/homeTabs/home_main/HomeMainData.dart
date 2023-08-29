// ignore_for_file: file_names, unnecessary_null_comparison, use_build_context_synchronously

part of 'HomeMainImports.dart';

class HomeMainData {
  HomeMainData._internal();
  static final HomeMainData _instance = HomeMainData._internal();
  factory HomeMainData() => _instance;

  PagingController<int, AdsModel> pagingController =
      PagingController(firstPageKey: 1);
  final TextEditingController search = TextEditingController();

  late TabController tabController;
  CatViewCubit catViewCubit = CatViewCubit();
  CatTabCubit catTabCubit = CatTabCubit();
  ListenerCubit listenerCubit = ListenerCubit();
  final ProductViewsCubit productViewsCubit = ProductViewsCubit();
  BrandsCubit brandsCubit = BrandsCubit();

  List<Category> mainCats = [];
  bool applyListener = true;
  int currentIndex = 0;

  int currentCat = 0;
  int regionId = 0;
  int cityId = 0;
  int filterType = 0;
  final int pageSize = 10;
  String searchText = "";

  Future<void> fetchPage(int pageKey, BuildContext context,
      {bool refresh = true}) async {
    var loc = context.read<LocationCubit>().state.model;
    FilterModel model = FilterModel(
      cityId: "$cityId",
      lat: loc.lat,
      lng: loc.lng,
      catId: "$currentCat",
      pageNumber: pageKey.toString(),
      pageSize: pageSize.toString(),
      regionId: "$regionId",
      typeFilter: "$filterType",
      title: searchText,
    );
    List<AdsModel> products =
        await CustomerRepository(context).getAdsData(model, true);
    if (pageKey == 1) {
      pagingController.itemList = [];
    }
    final isLastPage = products.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(products);
    } else {
      final nextPageKey = pageKey + 1;
      pagingController.appendPage(products, nextPageKey);
    }
    applyListener = true;
  }

  void addControllerListener() {
    HomeMainData().tabController.addListener(() {
      debugPrint(
          "-----------------------applyEnter $applyListener ${HomeMainData().tabController.index}");
      if (applyListener &&
          (HomeMainData().tabController.index != currentIndex)) {
        debugPrint("-----------------------applyDone");
      }
    });
  }

  resetTabs(int index) {
    HomeMainData().catTabCubit.onUpdateCatsTab(0);
    currentCat = mainCats[HomeMainData().tabController.index].id!;
    HomeMainData().catViewCubit.onUpdateCatRows([]);
  }

  Future<List<SearchModel>> getAutoCompleteSuggestions(
      BuildContext context, String text) async {
    var data = await CustomerRepository(context).getSearchAds(text);
    return data;
  }

  void onSelectModel(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    searchText = search.text;
    HomeMainData().pagingController.refresh();
  }

  // void onSelectModel(BuildContext context,AdsModel model){
  //   AutoRouter.of(context).push(Routes.productDetails,arguments: ProductDetailsArguments(model: model));
  // }

  void setSelectCats(
      BuildContext context, int id, Category model, int index) async {
    catTabCubit.onUpdateCatsTab(id);
    brandsCubit.onUpdateBrands([], 0);
    if (id != 0) {
      catViewCubit.onUpdateCatRows([]);
      List<Category> children =
          await context.read<MyDatabase>().selectChildrenCatsAsync(id);
      if (children.isNotEmpty) {
        catViewCubit
            .onAddCatRow(CategoryChildModel(cats: children, parentId: id));
      }
      HomeMainData().currentCat = id;
    } else {
      HomeMainData().currentCat = model.parentId!;
    }

    HomeMainData().pagingController.refresh();
  }

  void setSelectSubCats(
      BuildContext context, int id, int parentId, int index) async {
    brandsCubit.onUpdateBrands([], 0);
    if (id != 0) {
      List<Category> children =
          await context.read<MyDatabase>().selectChildrenCatsAsync(id);
      catViewCubit.updateSelectedCat(parentId, index);
      if (children.isNotEmpty) {
        if (catViewCubit.state.catRows.length == 1) {
          brandsCubit.onUpdateBrands(children, id);
        } else {
          catViewCubit
              .onAddCatRow(CategoryChildModel(cats: children, parentId: id));
        }
      }
      HomeMainData().currentCat = id;
    } else {
      catViewCubit.updateSelectedCat(parentId, index);
      HomeMainData().currentCat = parentId;
    }
    HomeMainData().pagingController.refresh();
  }

  void navigateToLocationAddress(BuildContext context) async {
    LoadingDialog.showLoadingDialog();
    LocationData loc = await Utils.getCurrentLocation();
    EasyLoading.dismiss();
    if (loc != null) {
      await AutoRouter.of(context)
          .push(FilterLocationRoute(lat: loc.latitude!, lng: loc.longitude!));
    } else {
      await AutoRouter.of(context)
          .push(FilterLocationRoute(lat: 24.774265, lng: 46.738586));
    }
  }

  void removeLocation(BuildContext context) {
    context
        .read<LocationCubit>()
        .onLocationUpdated(const LocationModel("0", "0", ""), change: false);
    pagingController.refresh();
  }

  void changeProductView(BuildContext context) {
    productViewsCubit.setChangeView(
        showGrid: !productViewsCubit.state.showGrid);
  }

  void addAllToCategory(List<Category> lst, int parent) {
    var exist = lst.where((element) => element.id == 0).toList();
    if (lst.isNotEmpty && exist.isEmpty) {
      lst.insert(
        0,
        Category(
          id: 0,
          name: "الكل",
          img: "",
          parentId: parent,
          selected: true,
          showSideManu: false,
          idU: 0,
        ),
      );
    }
  }
}
