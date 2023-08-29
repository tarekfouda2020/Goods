// ignore_for_file: file_names, library_private_types_in_public_api, unused_element

part of 'MyProductsImports.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> with MyProductsData {
  @override
  void initState() {
    myAdsCubit.fetchUserAds(context, refresh: false);
    myAdsCubit.fetchUserAds(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "اعلاناتي", con: context),
      backgroundColor: MyColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _buildHeaderView(user),
          _buildProductListView()
        ],
      ),
    );
  }

  Widget _buildHeaderView(UserModel user) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  Icons.person_outline,
                  size: 25,
                  color: MyColors.black,
                ),
              ),
              MyText(
                title: user.userName!,
                size: 10,
                color: MyColors.black,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: user.publishDate!,
                  size: 10,
                  color: MyColors.blackOpacity,
                ),
                RatingBar.builder(
                  initialRating: user.rate!.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  updateOnDrag: false,
                  onRatingUpdate: (rate) {},
                  ignoreGestures: true,
                  itemCount: 5,
                  itemSize: 16,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductListView() {
    return BlocBuilder<MyAdsCubit, MyAdsState>(
      bloc: myAdsCubit,
      builder: (context, state) {
        if (state is MyAdsUpdated) {
          if (state.ads.isNotEmpty) {
            return _buildProductsView(state.ads);
          } else {
            return Center(
              child: MyText(
                title: "لايوجد بيانات",
                size: 12,
                color: MyColors.blackOpacity,
              ),
            );
          }
        } else {
          return _buildLoadingView();
        }
      },
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: LoadingDialog.showLoadingView(),
    );
  }

  Widget _buildProductsView(List<EditAdModel> ads) {
    return Flexible(
      child: CustomPullRefresh(
        controller: refreshController,
        onRefresh: () =>
            myAdsCubit.setRefreshUserAds(context, refreshController),
        child: ListView.builder(
          itemCount: ads.length,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, index) {
            AdsModel adsModel = AdsModel(
              title: ads[index].title,
              id: ads[index].id,
              lng: ads[index].lng,
              lat: ads[index].lat,
              img: ads[index].img,
              allImg: ads[index].allImg,
              checkRate: ads[index].checkRate,
              checkWishList: ads[index].checkWishList,
              countComment: ads[index].countComment,
              date: ads[index].date,
              location: ads[index].location,
              userName: ads[index].userName,
              // price: ads[index].price,
              fromAppOrNo: ads[index].fromAppOrNo,
              info: ads[index].info, locationPlus: '',
            );
            return Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    label: tr("delete"),
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    onPressed: (context) => _buildConfirmRemoveAd(ads[index]),
                  ),
                  SlidableAction(
                    label: tr("update"),
                    backgroundColor: Colors.blueAccent,
                    icon: Icons.edit,
                    onPressed: (context) => navigateTo(context, ads[index]),
                  ),
                ],
              ),
              child: ProductRow(index: index, model: adsModel, adOwnerImg: '',),
            );
          },
        ),
      ),
    );
  }

  void _buildConfirmRemoveAd(EditAdModel model) {
    LoadingDialog.showConfirmDialog(
        context: context,
        title: "تأكيد حذف الإعلان",
        confirm: () => myAdsCubit.stRemoveMyAd(context, model));
  }
}
