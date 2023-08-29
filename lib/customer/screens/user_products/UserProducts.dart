// ignore_for_file: library_private_types_in_public_api, file_names

part of 'UserProductsImports.dart';

class UserProducts extends StatefulWidget {
  final String userId;
  final String userName;
  const UserProducts({super.key, required this.userId, required this.userName});
  @override
  _UserProductsState createState() => _UserProductsState();
}

class _UserProductsState extends State<UserProducts> with UserProductsData {
  @override
  void initState() {
    userAdsCubit.fetchUserAds(context, widget.userId, addOwnerCubit,
        refresh: false);
    userAdsCubit.fetchUserAds(context, widget.userId, addOwnerCubit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;
    return Scaffold(
      appBar: DefaultAppBar(title: widget.userName, con: context),
      backgroundColor: MyColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderView(user),
          _buildProductContainer(),
        ],
      ),
    );
  }

  Widget _buildHeaderView(UserModel user) {
    return BlocBuilder<AddOwnerCubit, AddOwnerState>(
      bloc: addOwnerCubit,
      builder: (context, state) {
        if (state is AddOwnerUpdated) {
          debugPrint(state.model!.toJson().toString());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CachedImage(
                      url: state.model!.imgProfile,
                      width: 40,
                      height: 40,
                      haveRadius: false,
                      fit: BoxFit.cover,
                      boxShape: BoxShape.circle,
                    ),
                  ),
                  MyText(
                    title: state.model!.userName,
                    size: 10,
                    color: MyColors.black,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RatingBar.builder(
                      initialRating: state.model!.rate.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      updateOnDrag: false,
                      ignoreGestures: true,
                      itemCount: 5,
                      itemSize: 16,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        debugPrint(rating.toString());
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: "مشترك  ${state.model!.publishDate}",
                      size: 8,
                      color: MyColors.blackOpacity,
                    ),
                    TitleButton(
                      padding: const EdgeInsets.all(0),
                      iconData: Icons.chat,
                      title: "التعليقات",
                      onTap: () => navigateToComments(context, state.model!),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => navigateToChat(
                        context, widget.userId, widget.userName, user),
                    icon: Icon(
                      Icons.mail,
                      size: 20,
                      color: MyColors.black,
                    ),
                    label: MyText(
                      title: "مراسلة",
                      size: 10,
                      color: MyColors.black,
                    ),
                  ),
                  TitleButton(
                      iconData: Icons.wifi,
                      title: "متابعة",
                      iconColor: state.model!.showFollow!
                          ? MyColors.primary
                          : Colors.black87,
                      onTap: () =>
                          setAddUserToFollowers(context, widget.userId)),
                ],
              ),
              Visibility(
                visible: !state.model!.showRate!,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleButton(
                        padding: const EdgeInsets.only(bottom: 10),
                        iconData: Icons.star,
                        iconColor: MyColors.black,
                        title: "تقييم المستخدم",
                        onTap: () => _buildRateUserDialog(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildProductContainer() {
    return Flexible(
      child: BlocBuilder<UserAdsCubit, UserAdsState>(
        bloc: userAdsCubit,
        builder: (context, state) {
          if (state is UserAdsUpdated) {
            if (state.ads.isNotEmpty) {
              return _builtProductsListView(state.ads);
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
      ),
    );
  }

  Widget _buildLoadingView() {
    return Center(child: LoadingDialog.showLoadingView());
  }

  Widget _builtProductsListView(List<AdsModel> products) {
    return CustomPullRefresh(
      controller: refreshController,
      onRefresh: () => userAdsCubit
        ..setRefreshUserAds(context, widget.userId, refreshController),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductRow(
            index: index,
            model: products[index], adOwnerImg: '',
          );
        },
      ),
    );
  }

  void _buildRateUserDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors.white,
          titlePadding: const EdgeInsets.all(0),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          title: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: "تقييم",
                  size: 12,
                  color: Colors.black87,
                ),
                InkWell(
                  child: const Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.black87,
                  ),
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
          content: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<RateUserCubit, RateUserState>(
                  bloc: rateUserCubit,
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: RatingBar.builder(
                        initialRating: state.rate,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        updateOnDrag: false,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) =>
                            rateUserCubit.onUpdateRateValue(rating),
                      ),
                    );
                  },
                ),
                DefaultButton(
                    title: "ارسال",
                    onTap: () =>
                        setUserRate(context, widget.userId, addOwnerCubit))
              ],
            ),
          ),
        );
      },
    );
  }
}
