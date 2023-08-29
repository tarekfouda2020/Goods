// ignore_for_file: file_names, library_private_types_in_public_api

part of 'HomeMainImports.dart';

class HomeMain extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  final int parentCount;
  const HomeMain(
      {super.key, required this.scaffold, required this.parentCount});
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
     HomeMainData().tabController =
        TabController(length: widget.parentCount, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Category>>(
      stream: context.watch<MyDatabase>().selectParentCats(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           HomeMainData().mainCats = snapshot.data!;
          return DefaultTabController(
            length: snapshot.data!.length,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: MyColors.primary,
                // title: AutoCompleteField<SearchModel>(
                //   label: "كلمة البحث",
                //   onSubmit: (model)=>onSelectModel(context,model.adsInfo),
                //   onSearch:(text)async=> getAutoCompleteSuggestions(context,text),
                // ),
                title: IconTextFiled(
                  controller: HomeMainData().search,
                  margin: const EdgeInsets.only(top: 25),
                  label: "كلمة البحث",
                  submit: (value) => HomeMainData().onSelectModel(context),
                  type: TextInputType.text,
                  action: TextInputAction.search,
                  icon: IconButton(
                    icon: const Icon(Icons.search, size: 25),
                    onPressed: () => HomeMainData().onSelectModel(context),
                  ),
                  validate: (String value) {},
                ),
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(),
                toolbarHeight: 70,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                    color: MyColors.white,
                  ),
                  onPressed: () => widget.scaffold.currentState!.openDrawer(),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.view_quilt_sharp,
                      size: 30,
                      color: MyColors.white,
                    ),
                    onPressed: () =>
                        widget.scaffold.currentState!.openEndDrawer(),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors.greyWhite,
                        border: Border(
                            bottom: BorderSide(
                                color: MyColors.greyWhite.withOpacity(1)))),
                    child: TabBar(
                        controller:  HomeMainData().tabController,
                        isScrollable: true,
                        onTap:  HomeMainData().resetTabs,
                        indicatorColor: MyColors.primary,
                        labelColor: MyColors.primary,
                        unselectedLabelColor: MyColors.blackOpacity,
                        tabs: List.generate(snapshot.data!.length, (index) {
                          return Tab(
                            child: MyText(
                              title: snapshot.data![index].name,
                              size: 12,
                            ),
                          );
                        })),
                  ),
                  Flexible(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller:  HomeMainData().tabController,
                      children: List.generate(snapshot.data!.length, (index) {
                        return _buildPageView(snapshot.data![index].id!);
                      }),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return _buildLoadingView();
        }
      },
    );
  }


  Widget _buildPageView(int parent) {
    return StreamBuilder<List<Category>>(
      stream: context.read<MyDatabase>().selectChildrenCats(parent),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Visibility(
                  visible: snapshot.data!.isNotEmpty,
                  child: BlocBuilder<CatTabCubit, CatTabState>(
                    bloc:  HomeMainData().catTabCubit,
                    builder: (context, state) {
                      return _buildCategoryView(
                        snapshot.data!,
                        parent,
                        state.id,
                      );
                    },
                  ),
                ),
                BlocBuilder<CatViewCubit, CatViewState>(
                  bloc:  HomeMainData().catViewCubit,
                  builder: (context, state) {
                    return Column(
                      children: List.generate(state.catRows.length, (index) {
                        return _buildSubCategoryView(state.catRows[index].cats,
                            state.catRows[index].parentId);
                      }),
                    );
                  },
                ),
                Flexible(
                    child: HomeMainAds(
                  catId: parent,
                )),
              ],
            ),
          );
        } else {
          return _buildLoadingView();

        }
      },
    );
  }

  Widget _buildCategoryView(List<Category> lst, int parent, int current) {
    HomeMainData().addAllToCategory(lst, parent);
    return Container(
      height: 45,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lst.length,
        itemBuilder: (BuildContext con, int position) {
          return _buildCatItem(lst[position], position, current);
        },
      ),
    );
  }

  Widget _buildCatItem(Category model, int index, int current) {
    Color color = model.id == current ? MyColors.primary : MyColors.greyWhite;
    Color textColor =
        model.id == current ? MyColors.white : MyColors.blackOpacity;
    return InkWell(
      onTap: () => HomeMainData().setSelectCats(context, model.id!, model, index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: MyText(
          title: model.name,
          size: 10,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildSubCategoryView(List<Category> lst, int parent) {
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
    return Container(
      height: 45,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lst.length,
        itemBuilder: (BuildContext con, int position) {
          return _buildSubCatItem(lst[position], position);
        },
      ),
    );
  }

  Widget _buildSubCatItem(Category model, int index) {
    Color color = model.selected ? MyColors.primary : MyColors.greyWhite;
    Color textColor = model.selected ? MyColors.white : MyColors.blackOpacity;
    return InkWell(
      onTap: () => HomeMainData().setSelectSubCats(context, model.id!, model.parentId!, index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: MyText(
          title: model.name,
          size: 10,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: LoadingDialog.showLoadingView(),
    );
  }
}
