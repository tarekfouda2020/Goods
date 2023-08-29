// ignore_for_file: file_names, library_private_types_in_public_api

part of 'FollowerAdsImports.dart';

class FollowerAds extends StatefulWidget {
  const FollowerAds({super.key});

  @override
  _FollowerAdsState createState() => _FollowerAdsState();
}

class _FollowerAdsState extends State<FollowerAds> {
  final FollowerAdsCubit followerAdsCubit = FollowerAdsCubit();

  @override
  void initState() {
    followerAdsCubit.fetchUserAds(context, refresh: false);
    followerAdsCubit.fetchUserAds(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowerAdsCubit, FollowerAdsState>(
      bloc: followerAdsCubit,
      builder: (context, state) {
        if (state is FollowerAdsUpdated) {
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

  Widget _buildProductsView(List<AdsModel> ads) {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: ads.length,
      itemBuilder: (context, index) {
        return _buildProductSlideView(
          index: index,
          model: ads[index],
        );
      },
    );
  }

  Widget _buildProductSlideView({required AdsModel model, required int index}) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: tr("remove"),
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (context) => _buildConfirmRemoveFollowAd(model),
          ),
        ],
      ),
      child: ProductRow(index: index, model: model, adOwnerImg: '',),
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: LoadingDialog.showLoadingView(),
    );
  }

  void _buildConfirmRemoveFollowAd(AdsModel model) {
    LoadingDialog.showConfirmDialog(
        context: context,
        title: "تأكيد حذف الاعلان من المتابعة",
        confirm: () => followerAdsCubit.removeFollowAd(context, model));
  }
}
