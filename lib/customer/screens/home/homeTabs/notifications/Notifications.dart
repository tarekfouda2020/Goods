// ignore_for_file: library_private_types_in_public_api, file_names

part of 'NotificationImports.dart';

class Notifications extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;

  const Notifications({super.key, required this.scaffold});
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> with NotificationsData {
  @override
  void initState() {
    notifyCubit.fetchData(context, refresh: false);
    notifyCubit.fetchData(context);
    HomeMainData().pagingController.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(
          con: context,
          title: "الإشعارات",
          leading: Container(),
          actions: [
            IconButton(
              onPressed: _buildConfirmRemoveAllNotifications,
              icon: Icon(
                Icons.delete,
                size: 25,
                color: MyColors.white,
              ),
            )
          ],
        ),
        body: BlocBuilder<NotifyCubit, NotifyState>(
          bloc: notifyCubit,
          builder: (context, state) {
            if (state is NotifyUpdated) {
              if (state.notifies.isNotEmpty) {
                return _buildNotifiesList(state.notifies);
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
        ));
  }

  Widget _buildNotifiesList(List<NotifyModel> lst) {
    return CustomPullRefresh(
      controller: refreshController,
      onRefresh: () => notifyCubit..setRefreshData(context, refreshController),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: lst.length,
        itemBuilder: (con, index) {
          return _buildNotifySlideView(index: index, model: lst[index]);
        },
      ),
    );
  }

  Widget _buildNotifySlideView({
    required NotifyModel model,
    required int index,
  }) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: tr("remove"),
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (context) => _buildConfirmRemoveNotify(model),
          ),
        ],
      ),
      child: _buildNotifyItem(index: index, model: model),
    );
  }

  _buildNotifyItem({
    required int index,
    required NotifyModel model,
  }) {
    return SizedBox(
      child: InkWell(
        onTap: () => navigateToDetails(context, model),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              color: index.isEven ? MyColors.white : MyColors.greyWhite,
              border: Border(
                  bottom: BorderSide(color: MyColors.greyWhite, width: 1))),
          child: Column(
            children: [
              Row(
                children: [
                  MyText(
                    title: model.text,
                    size: 10,
                    color:
                        model.show ? MyColors.blackOpacity : MyColors.primary,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyText(
                    title: model.date,
                    size: 9,
                    color: MyColors.blackOpacity,
                  ),
                ],
              ),
            ],
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

  void _buildConfirmRemoveNotify(NotifyModel model) {
    LoadingDialog.showConfirmDialog(
        context: context,
        title: "تأكيد حذف الإشعار",
        confirm: () => notifyCubit.removeNotify(context, model));
  }

  void _buildConfirmRemoveAllNotifications() {
    if (notifyCubit.state.notifies.isNotEmpty) {
      LoadingDialog.showConfirmDialog(
          context: context,
          title: "تأكيد حذف جميع الإشعارات",
          confirm: () => notifyCubit.removeNotifications(context));
    } else {
      LoadingDialog.showSimpleToast("ليس لديك اشعارات");
    }
  }
}
