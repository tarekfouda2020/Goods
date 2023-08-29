// ignore_for_file: file_names

part of 'UserProductsImports.dart';

class UserProductsData {
  final RefreshController refreshController = RefreshController();
  final UserAdsCubit userAdsCubit = UserAdsCubit();
  final RateUserCubit rateUserCubit = RateUserCubit();
  final AddOwnerCubit addOwnerCubit = AddOwnerCubit();

  void setAddUserToFollowers(BuildContext context, String userId) async {
    var auth = context.read<AuthCubit>().state.authorized;
    if (auth) {
      var result = await CustomerRepository(context).addUserToFollower(userId);
      if (result) {
        addOwnerCubit.onUpdateFollow(!addOwnerCubit.state.model!.showFollow!);
      }
    } else {
      LoadingDialog.showAuthDialog(context: context);
    }
  }

  void setUserRate(
      BuildContext context, String userId, AddOwnerCubit addOwnerCubit) {
    var auth = context.read<AuthCubit>().state.authorized;
    if (auth) {
      int rate = rateUserCubit.state.rate.toInt();
      if (rate == 0) {
        LoadingDialog.showSimpleToast("قم باضافة التقييم");
        return;
      }
      rateUserCubit.setRateUser(context, userId, addOwnerCubit);
    } else {
      LoadingDialog.showAuthDialog(context: context);
    }
  }

  void navigateToComments(BuildContext context, AdOwnerModel data) {
    var auth = context.read<AuthCubit>().state.authorized;
    if (auth) {
      AutoRouter.of(context).push(UserCommentsRoute(userId: data.id));
    } else {
      LoadingDialog.showAuthDialog(context: context);
    }
  }

  void navigateToChat(
      BuildContext context, String userId, String userName, UserModel user) {
    var auth = context.read<AuthCubit>().state.authorized;
    if (auth) {
      AutoRouter.of(context).push(ChatRoute(
          senderId: user.id!, receiverId: userId, userName: userName));
    } else {
      LoadingDialog.showAuthDialog(context: context);
    }
  }
}
