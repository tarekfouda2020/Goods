// ignore_for_file: file_names

part of 'NotificationImports.dart';

class NotificationsData {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final NotifyCubit notifyCubit = NotifyCubit();

  void navigateToDetails(BuildContext context, NotifyModel model) {
    if (model.type >= 1 && model.type <= 4) {
      AutoRouter.of(context).push(ProductDetailsRoute(model: model.adsInfo));
    } else if (model.type == 5 || model.type == 6 || model.type == 8) {
      AutoRouter.of(context).push(
          UserProductsRoute(userId: model.fkUser, userName: model.userName));
    }
  }
}
