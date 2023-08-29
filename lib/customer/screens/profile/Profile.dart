// ignore_for_file: library_private_types_in_public_api, file_names

part of 'ProfileImports.dart';

class Profile extends StatefulWidget {
  final String? name;

  const Profile({super.key, this.name});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    commentCubit.setFetchData(context);
    super.initState();
  }

  final CommentCubit commentCubit = CommentCubit();
  final RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;
    return Scaffold(
      appBar: DefaultAppBar(
        title: user.userName!,
        con: context,
        actions: [
          IconButton(
            onPressed: () =>
                AutoRouter.of(context).push(EditProfileRoute(user: user)),
            icon: const Icon(
              Icons.edit,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: MyColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildHeaderView(), _buildCommentsListView()],
      ),
    );
  }

  Widget _buildHeaderView() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 5),
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
                    title: state.model.userName!,
                    size: 10,
                    color: MyColors.black,
                  ),
                  const Spacer(),
                  // DefaultButton(
                  //   width: 100,
                  //   title: 'حذف الحساب',
                  //   onTap: () {
                  //   },
                  // )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: " مشترك ${state.model.publishDate} ",
                      size: 10,
                      color: MyColors.blackOpacity,
                    ),
                    RatingBar.builder(
                      initialRating: state.model.rate!.toDouble(),
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
                  ],
                ),
              ),
              const TitleButton(
                iconData: Icons.chat,
                title: "التعليقات",
                onTap: null,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCommentsListView() {
    return BlocBuilder<CommentCubit, CommentState>(
      bloc: commentCubit,
      builder: (context, state) {
        if (state is CommentUpdated) {
          return Flexible(
            child: CustomPullRefresh(
              controller: refreshController,
              onRefresh: () =>
                  commentCubit..setRefreshData(context, refreshController),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: state.comments!.length,
                itemBuilder: (context, index) {
                  return _buildCommentView(state.comments![index]);
                },
              ),
            ),
          );
        } else {
          return _buildLoadingView();
        }
      },
    );
  }

  Widget _buildCommentView(CommentModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: MyColors.greyWhite.withOpacity(.1),
          border: Border(
              bottom:
                  BorderSide(color: MyColors.grey.withOpacity(.5), width: 1))),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 20,
                color: Colors.black87,
              ),
              MyText(
                title: model.userName,
                size: 10,
                color: Colors.black87,
              ),
              const Spacer(),
              MyText(
                title: model.creationDate,
                size: 10,
                color: Colors.black45,
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 5),
            child: MyText(
              title: model.text,
              size: 10,
              color: MyColors.blackOpacity,
            ),
          ),
          const Visibility(
              visible: false,
              child: Icon(
                Icons.thumb_up_alt,
                size: 20,
                color: Colors.black87,
              ))
        ],
      ),
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: LoadingDialog.showLoadingView(),
    );
  }
}
