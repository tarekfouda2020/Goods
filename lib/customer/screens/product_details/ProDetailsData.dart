// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously, file_names

part of 'ProDetailsImports.dart';

class ProDetailsData {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController report = TextEditingController();
  final FavouriteCubit favouriteCubit = FavouriteCubit();
  final ProductDetailsCubit productDetailsCubit = ProductDetailsCubit();
  final CommentCubit commentCubit = CommentCubit();
  final GlobalKey<FormState> commentFormKey = GlobalKey();
  final GlobalKey<FormState> repFormKey = GlobalKey();
  final TextEditingController comment = TextEditingController();
  final TextEditingController reply = TextEditingController();
  final TextEditingController reason = TextEditingController();
  final GenericCubit<ChewieController?> videoCubit = GenericCubit(null);

  final String baseUrl = "${MainData.baseUrl}/Info/GetInfoDetails";

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  Future<void> fetchData(
      BuildContext context, AdsDataModel? info, int id) async {
    if (info != null) {
      productDetailsCubit.onModelUpdated(
          AdsDetailsModel(adsData: info, relatedAds: []),
          favouriteCubit,
          commentCubit);
    }
    var data = await productDetailsCubit.fetchAdsDetails(
        context, id, favouriteCubit, commentCubit,
        refresh: true);
    if (data.adsData.video != null && data.adsData.video.isNotEmpty) {
      initVideoData(data.adsData.video);
    }
  }


  initVideoData(String url) async {
    videoPlayerController = VideoPlayerController.network(url);
    await videoPlayerController!.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
    );
    videoCubit.onUpdateData(chewieController);
  }

  void setAddReport(BuildContext context, int id) async {
    if (formKey.currentState!.validate()) {
      var result =
          await CustomerRepository(context).addAdsReport("$id", report.text);
      if (result) {
        AutoRouter.of(context).pop();
      }
    }
  }

  void navigateToChat(BuildContext context, AdsDataModel data, UserModel user) {
    var auth = context.read<AuthCubit>().state.authorized;
    if (auth) {
      AutoRouter.of(context).push(ChatRoute(
          senderId: user.id!,
          receiverId: data.fkUser,
          userName: data.userName));
    } else {
      LoadingDialog.showAuthDialog(context: context);
    }
  }

  void navigateToComments(BuildContext context, AdsDataModel data) async {
    var auth = context.read<AuthCubit>().state.authorized;
    if (auth) {
      var comments = await AutoRouter.of(context).push(
              ProductCommentsRoute(adsId: data.id, hideReply: data.closeReply))
          as List<CommentModel>;

      if (comments != null) {
        commentCubit.onSetCommentsList(comments);
      }
    } else {
      LoadingDialog.showAuthDialog(context: context);
    }
  }

  void addToFavourite(BuildContext context, AdsModel model) async {
    await favouriteCubit.setAddToFavourite(context, model);
    productDetailsCubit.fetchAdsDetails(
        context, model.id, favouriteCubit, commentCubit);
    HomeMainData().pagingController.refresh();
  }

  void removeFromFavourite(BuildContext context, AdsModel model) async {
    await favouriteCubit.setRemoveFavourite(context, model);
    productDetailsCubit.fetchAdsDetails(
        context, model.id, favouriteCubit, commentCubit);
    HomeMainData().pagingController.refresh();
  }

  void setFollowAds(BuildContext context, AdsModel model) async {
    await favouriteCubit.setAddToFollower(context, model.id);
    productDetailsCubit.fetchAdsDetails(
        context, model.id, favouriteCubit, commentCubit);
  }

  void setAddComment(BuildContext context, int id) async {
    if (comment.text.isNotEmpty) {
      await commentCubit.setAddComment(context, id, comment.text);
      comment.text = "";
      HomeMainData().pagingController.refresh();
    }
  }

  void setAddReply(BuildContext context, int id) async {
    if (repFormKey.currentState!.validate()) {
      await commentCubit.setAddReply(context, id, reply.text);
      reply.text = "";
      AutoRouter.of(context).pop();
    }
  }

  void setRemoveAd(BuildContext context, AdsModel model) {
    if (formKey.currentState!.validate()) {
      stRemoveMyAd(context, model, reason.text);
    }
  }

  stRemoveMyAd(BuildContext context, AdsModel adsModel, String reason) async {
    var result = await CustomerRepository(context).removeMyAd(adsModel.id);
    if (result) {
      Navigator.of(context).pop();
      HomeMainData().pagingController.refresh();
      AutoRouter.of(context).push(HomeRoute(parentCount: 0));
    }
  }

  void navigateTo(BuildContext context, AdsDataModel model) {
    AutoRouter.of(context).push(EditOfferImagesRoute(model: model));
  }

  onCloseComment(BuildContext context, int id, bool value) async {
    LoadingDialog.showLoadingDialog();
    await CustomerRepository(context).setCloseReply(id);
    await fetchData(context, null, id);
    EasyLoading.dismiss();
    HomeMainData().pagingController.refresh();
  }

  void refreshMyAd(BuildContext context, int id) async {
    await CustomerRepository(context).refreshMyAd(id);
  }

  void _buildConfirmRemoveAd(AdsModel model, BuildContext context) {
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
                  title: "تأكيد حذف الإعلان",
                  size: 12,
                  color: Colors.white,
                ),
                InkWell(
                  child: const Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.white,
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
                Form(
                  key: formKey,
                  child: RichTextFiled(
                    controller: reason,
                    height: 100,
                    label: "اكتب السبب ....",
                    max: 10,
                    min: 6,
                    submit: (value) => setRemoveAd(context, model),
                    validate: (value) =>
                        Validator().validateEmpty(value: value),
                  ),
                ),
                DefaultButton(
                  title: "ارسال",
                  onTap: () => setRemoveAd(context, model),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
