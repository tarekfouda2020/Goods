// ignore_for_file: file_names, library_private_types_in_public_api, unnecessary_null_comparison

part of 'ProDetailsImports.dart';

class ProductDetails extends StatefulWidget {
  final AdsModel model;
  final AdsDataModel? info;

  const ProductDetails({super.key, required this.model, this.info});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with ProDetailsData {
  @override
  void initState() {
    fetchData(context, widget.info, widget.model.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;

    return Scaffold(
      appBar: DefaultAppBar(
        title: "تفاصيل الإعلان",
        con: context,
        actions: [
          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            bloc: productDetailsCubit,
            builder: (_, state) {
              return Offstage(
                offstage: user.userName != widget.model.userName,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 25,
                    color: MyColors.white,
                  ),
                  onPressed: () => navigateTo(context, state.model!.adsData),
                ),
              );
            },
          ),
          Offstage(
            offstage: user.userName != widget.model.userName,
            child: IconButton(
              icon: Icon(
                Icons.delete_outline,
                size: 25,
                color: MyColors.white,
              ),
              onPressed: () => _buildConfirmRemoveAd(widget.model, context),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              size: 25,
              color: MyColors.white,
            ),
            onPressed: () => Utils.shareApp("$baseUrl/${widget.model.id}"),
          ),
        ],
      ),
      backgroundColor: MyColors.white,
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        bloc: productDetailsCubit,
        builder: (context, state) {
          if (state is ProductDetailsUpdated) {
            return Column(
              children: [
                Flexible(
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      _buildHeader(context, state.model!.adsData, user),
                      _buildProductDetails(
                        state.model!.adsData.description!,
                        state.model!.adsData.fromAppOrNo,
                        state.model!.adsData.notes!,
                        state.model!.adsData.id,
                      ),
                      _buildProductImages(context, state.model!.adsData.allImg),
                      _buildContactView(context, state.model!.adsData, user),
                      _buildCommentList(user, state.model!.adsData),
                      Visibility(
                        visible: state.model!.adsData.video != null,
                        replacement: const CupertinoActivityIndicator(),
                        child: buildVideoView(),
                        // replacement:_buildLoadingView(),
                      ),
                      Offstage(
                        offstage: state.model!.relatedAds!.isEmpty,
                        child: _buildRelatedProSlider(
                            context, state.model!.relatedAds!),
                      ),
                    ],
                  ),
                ),
                Offstage(
                  offstage: state.model!.adsData.closeReply ||
                      !context.watch<AuthCubit>().state.authorized,
                  child: _buildAddCommentInput(),
                )
              ],
            );
          } else {
            return _buildLoadingView();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Offstage(
        offstage: user.userName != widget.model.userName,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 75.0),
          child: FloatingActionButton(
            backgroundColor: MyColors.primary,
            onPressed: () => refreshMyAd(context, widget.model.id),
            child: Icon(Icons.refresh, size: 25, color: MyColors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: LoadingDialog.showLoadingView(),
    );
  }

  Widget _buildFavouriteIcon() {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      bloc: favouriteCubit,
      builder: (context, state) {
        return badges.Badge(
          // ignore: sort_child_properties_last
          child: Visibility(
            visible: state.fav,
            replacement: IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: 25,
                color: MyColors.black,
              ),
              onPressed: () => addToFavourite(context, widget.model),
            ),
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                size: 25,
                color: MyColors.black,
              ),
              onPressed: () => removeFromFavourite(context, widget.model),
            ),
          ),
          badgeColor: Colors.red,
          badgeContent: Text(
            "${state.count}",
            style: const TextStyle(color: Colors.white),
          ),
          padding: const EdgeInsets.all(4),
          position: const BadgePosition(top: 0, start: 5),
          toAnimate: true,
          animationType: BadgeAnimationType.scale,
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, AdsDataModel data, UserModel user) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      color: MyColors.greyWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: MyText(
                  title: data.title,
                  size: 12,
                  color: MyColors.greenColor,
                ),
              ),
              Visibility(
                visible: data.showPrice,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    decoration: BoxDecoration(
                      color: MyColors.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: MyText(
                      title: "${data.price} ريال",
                      size: 9,
                      color: MyColors.white,
                    )),
              )
            ],
          ),
          Visibility(
            visible: data.showMap,
            child: InkWell(
              onTap: () => Utils.navigateToMapWithDirection(
                  lat: data.lat!, lng: data.lng!, title: data.title),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Icon(Icons.location_pin, size: 20, color: MyColors.black),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: MyText(
                      title: data.location!,
                      size: 9,
                      color: MyColors.blackOpacity,
                    ))
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: user.id != data.fkUser,
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => AutoRouter.of(context).push(UserProductsRoute(
                        userId: data.fkUser, userName: data.userName)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: MyColors.primary,
                          child: Text(data.userName![0],textAlign:TextAlign.center,style: const TextStyle(
                              fontSize: 12
                          ),),
                        ),
                        SizedBox(width: 5,),
                        MyText(
                          title: data.userName,
                          size: 10,
                          color: MyColors.black,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  MyText(
                    title: data.date,
                    size: 10,
                    color: MyColors.blackOpacity,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Visibility(
                  visible: user.id != data.fkUser &&
                      context.watch<AuthCubit>().state.authorized,
                  child: BlocBuilder<FavouriteCubit, FavouriteState>(
                    bloc: favouriteCubit,
                    builder: (context, state) {
                      return TitleButton(
                        padding: const EdgeInsets.all(0),
                        iconData: Icons.wifi,
                        title: "متابعة الإعلان",
                        iconColor:
                            state.follow ? MyColors.greenColor : Colors.grey,
                        onTap: () => setFollowAds(context, widget.model),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Visibility(
                    visible: data.showPhone,
                    child: TitleButton(
                      padding: const EdgeInsets.all(0),
                      iconData: Icons.phone_enabled_rounded,
                      title: data.userPhone,
                      iconColor: Colors.black87,
                      onTap: () => Utils.callPhone(phone: data.userPhone),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails(
      String details, bool fromApp, String notes, int id) {
    List<dynamic> descList = [];
    if (fromApp) {
      descList = json.decode(details);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Visibility(
        // ignore: sort_child_properties_last
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xb32a3b55)),
                    child: const Text(
                      "رقم الاعلان",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    // decoration: const BoxDecoration(color: Color(0x1a2a3b55)),
                    child: Text(
                      "#${id}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(descList.length, (index) {
                return _buildDetailsItem(descList[index]);
              }),
            ),
            MyText(
              title: notes,
              size: 11,
              color: MyColors.black,
            )
          ],
        ),
        visible: fromApp,
        replacement:Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xb32a3b55)),
                    child: const Text(
                      "رقم الاعلان",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    // decoration: const BoxDecoration(color: Color(0x1a2a3b55)),
                    child: Text(
                      "#${id}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            _buildDetailsItem(details),
          ],
        )
      ),
    );
  }

// by Ahmed Fayez (Abo Hamza)
  Widget _descTextFormat(String value) {
    int idx = value.indexOf("؟");
    List parts = [];
    if (idx > 1) {
      parts = [
        value.substring(0, idx - 1).trim(),
        value.substring(idx + 1).trim()
      ];
    } else {
      parts = [value];
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return idx > 1
            ? Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(color: Color(0xb32a3b55)),
                      child: Text(
                        parts[0],
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(color: Color(0x1a2a3b55)),
                      child: Text(
                        parts[1],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            : Text(parts[0]);
      },
    );
  }

  Widget _buildDetailsItem(String value) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: _descTextFormat(value),
    );
  }

  Widget _buildProductImages(BuildContext context, List<ImageModel> images) {
    return Column(
      children: List.generate(images.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () => AutoRouter.of(context)
                .push(ImageZoomRoute(images: images, index: index)),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Container(
                  child: AspectRatio(
                    aspectRatio: 1.7,
                    child: CachedImage(
                      url: images[index].url,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      borderColor: MyColors.greyWhite,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset('assets/images/logoWhite.png',
                          height: 80, width: 80)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildContactView(
      BuildContext context, AdsDataModel data, UserModel user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: data.showPhone,
              child: _buildContactItem(
                icon: Icons.phone_enabled_rounded,
                title: "${data.phone}",
                onTab: () => Utils.callPhone(phone: data.phone),
              )),
          Visibility(
              visible: user.id != data.fkUser,
              child: _buildContactItem(
                icon: Icons.mail,
                title: "مراسلة",
                onTab: () => navigateToChat(context, data, user),
              )),
          _buildContactItem(
            icon: Icons.thumb_up_alt,
            title: "التقييم  ${data.userRate}",
            onTab: () {},
          ),
          _buildContactItem(
            icon: Icons.comment_outlined,
            title: "التعليقات",
            onTab: () => navigateToComments(context, data),
          ),
          Offstage(
            offstage: user.userName != widget.model.userName,
            child: Row(
              children: [
                Checkbox(
                  value: !data.closeReply,
                  onChanged: (val) =>
                      onCloseComment(context, widget.model.id, val!),
                ),
                const SizedBox(
                  width: 5,
                ),
                MyText(
                  title: "اظهار الرد علي التعليقات",
                  size: 10,
                  color: MyColors.blackOpacity,
                )
              ],
            ),
          ),
          //fav and report icon
          Visibility(
            visible: user.id != data.fkUser &&
                context.watch<AuthCubit>().state.authorized,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFavouriteIcon(),
                  IconButton(
                    icon:
                        Icon(Icons.flag_sharp, size: 25, color: MyColors.black),
                    onPressed: () => _buildAddReportDialog(context, data.id),
                  ),
                  Visibility(
                    visible: data.showPhone,
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 25,
                        color: MyColors.greenColor,
                      ),
                      onPressed: () => Utils.launchURL(url: data.whatsapp!),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyColors.grey, width: 1)),
            child: Row(
              children: [
                const Image(
                  image: AssetImage(Res.hands),
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: MyText(
                    title:
                        "المبايعة وجها لوجه وبمكان عام وبتحويل بنكي يقلل الخطر والإحتيال .",
                    size: 11,
                    color: MyColors.blackOpacity,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContactItem(
      {IconData? icon, String? title, required void Function()? onTab}) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: MyColors.greyWhite, width: 1))),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            MyText(
              title: title!,
              size: 12,
              color: MyColors.blackOpacity,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCommentList(UserModel user, AdsDataModel adsDataModel) {
    return BlocBuilder<CommentCubit, CommentState>(
      bloc: commentCubit,
      builder: (_, state) {
        var comments = state.comments.take(3).toList();
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Visibility(
                visible: comments.isNotEmpty,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: List.generate(comments.length, (index) {
                      return _buildCommentView(
                          comments[index], user, index, adsDataModel);
                    }),
                  ),
                ),
              ),
              Visibility(
                visible: state.comments.isNotEmpty,
                child: DefaultButton(
                  onTap: () => navigateToComments(context, adsDataModel),
                  title: "عرض كل التعليقات",
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  margin: EdgeInsets.zero,
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCommentView(CommentModel model, UserModel user, int index,
      AdsDataModel adsDataModel) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: MyColors.greyWhite.withOpacity(.1),
              border: Border(
                  bottom: BorderSide(
                      color: MyColors.grey.withOpacity(.5), width: 1))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => AutoRouter.of(context).push(UserProductsRoute(
                    userId: model.fKUser, userName: model.userName)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.black87,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MyText(
                      title: model.userName,
                      size: 12,
                      color: adsDataModel.fkUser == user.id
                          ? Colors.blue
                          : Colors.black87,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    adsDataModel.fkUser == user.id
                        ? const Icon(
                            Icons.mic,
                            size: 20,
                            color: Colors.blue,
                          )
                        : const SizedBox(),
                    const Spacer(),
                    MyText(
                      title: model.creationDate,
                      size: 10,
                      color: Colors.black45,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: MyText(
                    title: model.text, size: 11, color: MyColors.blackOpacity),
              ),
              Visibility(
                visible: adsDataModel.fkUser == user.id,
                // ignore: sort_child_properties_last
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => _buildConfirmRemoveComment(model),
                      child: const Icon(Icons.delete,
                          size: 20, color: Colors.black87),
                    ),
                  ],
                ),
                replacement: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Offstage(
                      offstage: adsDataModel.closeReply,
                      child: InkWell(
                        onTap: () => _buildAddReplyDialog(model.id),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: MyText(
                              title: "رد", size: 11, color: MyColors.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        _buildReplyList(model.replyList!, user, index, adsDataModel)
      ],
    );
  }

  Widget _buildReplyList(List<ReplyModel> replies, UserModel user, int index,
      AdsDataModel adsDataModel) {
    return Column(
      children: List.generate(replies.length, (position) {
        return _buildReplyView(replies[position], user, index, adsDataModel);
      }),
    );
  }

  Widget _buildReplyView(
      ReplyModel model, UserModel user, int index, AdsDataModel adsDataModel) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: MyColors.greyWhite.withOpacity(.1),
          border: Border(
              bottom:
                  BorderSide(color: MyColors.grey.withOpacity(.5), width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 20, color: Colors.black87),
              MyText(title: model.userName, size: 10, color: Colors.black87),
              const Spacer(),
              MyText(title: model.creationDate, size: 10, color: Colors.black45)
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: MyText(
                title: model.text, size: 10, color: MyColors.blackOpacity),
          ),
          Visibility(
            visible: adsDataModel.fkUser == user.id,
            // ignore: sort_child_properties_last
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => _buildConfirmRemoveReply(model, index),
                  child:
                      const Icon(Icons.delete, size: 20, color: Colors.black87),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.reply, size: 20, color: Colors.black45),
              ],
            ),
            replacement: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.reply, size: 20, color: Colors.black45),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddCommentInput() {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: MyColors.greyWhite))),
      child: Column(
        children: [
          ChatTextField(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            controller: comment,
            label: "اكتب تعليقك ....",
            action: TextInputAction.newline,
            submit: () => setAddComment(context, widget.model.id),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }

  void _buildAddReplyDialog(int commentId) {
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
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(title: "اضافة رد", size: 12, color: Colors.white),
                InkWell(
                  child: const Icon(Icons.close, size: 25, color: Colors.white),
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
                  key: repFormKey,
                  child: RichTextFiled(
                    controller: reply,
                    height: 100,
                    label: "اكتب تعليقك ....",
                    max: 10,
                    min: 6,
                    submit: (value) => setAddReply(context, commentId),
                    validate: (value) =>
                        Validator().validateEmpty(value: value),
                  ),
                ),
                DefaultButton(
                    title: "ارسال",
                    onTap: () => setAddReply(context, commentId))
              ],
            ),
          ),
        );
      },
    );
  }

  void _buildConfirmRemoveComment(CommentModel model) {
    LoadingDialog.showConfirmDialog(
        context: context,
        title: "تأكيد حذف التعليق",
        confirm: () => commentCubit.setRemoveComment(context, model));
  }

  void _buildConfirmRemoveReply(ReplyModel model, int index) {
    LoadingDialog.showConfirmDialog(
        context: context,
        title: "تأكيد حذف الرد",
        confirm: () => commentCubit.setRemoveReply(context, index, model));
  }

  Widget _buildRelatedProSlider(
      BuildContext context, List<AdsModel> relatedAds) {
    final orientation = MediaQuery.of(context).orientation;
    if (relatedAds.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MyText(
              title: "الإعلانات المشابهة",
              size: 12,
              color: MyColors.black,
            ),
          ),
          // Container(
          //   height: 200,
          //   width: MediaQuery.of(context).size.width,
          //   margin: const EdgeInsets.symmetric(vertical: 20),
          //   child: Swiper(
          //     itemBuilder: (BuildContext context, int index) {
          //       return CachedImage(
          //           url: relatedAds[index].img,
          //           width: MediaQuery.of(context).size.width - 50,
          //           height: 200,
          //           colorFilter: const ColorFilter.mode(
          //             Colors.black12,
          //             BlendMode.darken,
          //           ),
          //           alignment: Alignment.topLeft,
          //           fit: BoxFit.fill,
          //           borderRadius: const BorderRadius.all(Radius.circular(5)),
          //           child: Icon(
          //             Icons.favorite_border,
          //             size: 25,
          //             color: MyColors.white,
          //           ));
          //     },
          //     autoplay: relatedAds.length == 1 ? false : true,
          //     onTap: (index) => AutoRouter.of(context)
          //         .push(ProductDetailsRoute(model: relatedAds[index])),
          //     autoplayDelay: 3000,
          //     itemCount: relatedAds.length,
          //     scrollDirection: Axis.horizontal,
          //     // control: SwiperControl(),
          //     duration: 2000,
          //     autoplayDisableOnInteraction: true,
          //     layout: SwiperLayout.STACK,
          //     itemWidth: MediaQuery.of(context).size.width - 50,
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: GridView.builder(
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: relatedAds.length,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisSpacing: 10,
          //         mainAxisSpacing: 10,
          //         crossAxisCount:
          //             (orientation == Orientation.portrait) ? 2 : 3),
          //     itemBuilder: (BuildContext context, int index) {
          //       return InkWell(
          //         onTap: () => AutoRouter.of(context)
          //             .push(ProductDetailsRoute(model: relatedAds[index])),
          //         child: CachedImage(
          //             url: relatedAds[index].img,
          //             width: MediaQuery.of(context).size.width - 50,
          //             height: 200,
          //             colorFilter: const ColorFilter.mode(
          //               Colors.black12,
          //               BlendMode.darken,
          //             ),
          //             alignment: Alignment.topLeft,
          //             fit: BoxFit.fill,
          //             borderRadius: const BorderRadius.all(Radius.circular(5)),
          //             child: Icon(
          //               Icons.favorite_border,
          //               size: 25,
          //               color: MyColors.white,
          //             )),
          //       );
          //     },
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: StaggeredGridView.countBuilder(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10,
              itemCount: relatedAds.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () => AutoRouter.of(context)
                        .push(ProductDetailsRoute(model: relatedAds[index])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CachedImage(
                              url: relatedAds[index].img,
                              width: MediaQuery.of(context).size.width - 50,
                              colorFilter: const ColorFilter.mode(
                                Colors.black12,
                                BlendMode.darken,
                              ),
                              alignment: Alignment.topLeft,
                              fit: BoxFit.cover,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                              ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                              color: Colors.grey[100],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(relatedAds[index].title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1),
                                ],
                              ),
                            )),
                      ],
                    ));
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(
                    1, index.isEven ? 1.2 : 1.4); // others item
              },
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  void _buildAddReportDialog(BuildContext context, int id) {
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
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(title: "بلاغ", size: 12, color: Colors.black87),
                InkWell(
                  child:
                      const Icon(Icons.close, size: 25, color: Colors.black87),
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
                    controller: report,
                    height: 100,
                    label: "اكتب السبب ....",
                    max: 10,
                    min: 6,
                    submit: (value) => setAddReport(context, id),
                    validate: (value) =>
                        Validator().validateEmpty(value: value),
                  ),
                ),
                DefaultButton(
                    title: "ارسال", onTap: () => setAddReport(context, id))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildVideoView() {
    return BlocBuilder<GenericCubit<ChewieController?>,
        GenericState<ChewieController?>>(
      bloc: videoCubit,
      builder: (_, state) {
        if (state.data != null) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 300,
            width: double.infinity,
            child: Chewie(
              controller: chewieController!,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void dispose() {
    if (videoPlayerController != null && chewieController != null) {
      videoPlayerController!.dispose();
      chewieController!.dispose();
    }
    super.dispose();
  }
}
