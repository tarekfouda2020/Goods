// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:heraggoods/customer/models/NotifyModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
part 'notify_state.dart';

class NotifyCubit extends Cubit<NotifyState> {
  NotifyCubit() : super(NotifyInitial());

  onNotifyListUpdated(List<NotifyModel> lst) {
    emit(NotifyUpdated(lst, !state.changed));
  }

  Future<void> fetchData(BuildContext context, {bool refresh = true}) async {
    if (state.notifies.isEmpty) {
      String lang = context.read<LangBloc>().state.lang;
      var data =
          await CustomerRepository(context).getNotifications(lang, refresh);
      onNotifyListUpdated(data);
    }
  }

  Future<void> setRefreshData(
      BuildContext context, RefreshController controller,
      {bool refresh = true}) async {
    String lang = context.read<LangBloc>().state.lang;
    var data =
        await CustomerRepository(context).getNotifications(lang, refresh);
    onNotifyListUpdated(data);
    controller.refreshCompleted();
  }

  Future<void> removeNotify(BuildContext context, NotifyModel model) async {
    var result = await CustomerRepository(context).removeNotification(model.id);
    if (result) {
      state.notifies.remove(model);
      onNotifyListUpdated(state.notifies);
      AutoRouter.of(context).pop();
    }
  }

  Future<void> removeNotifications(BuildContext context) async {
    var result = await CustomerRepository(context).removeNotifications();
    if (result) {
      onNotifyListUpdated([]);
      AutoRouter.of(context).pop();
    }
  }
}
