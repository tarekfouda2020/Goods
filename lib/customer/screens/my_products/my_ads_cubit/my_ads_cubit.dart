// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/EditAdModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/screens/home/homeTabs/home_main/HomeMainImports.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'my_ads_state.dart';

class MyAdsCubit extends Cubit<MyAdsState> {
  MyAdsCubit() : super(MyAdsInitial());

  onUpdateAdsList(List<EditAdModel> ads) {
    emit(MyAdsUpdated(ads, !state.change));
  }

  fetchUserAds(BuildContext context, {bool refresh = true}) async {
    var lang = context.read<LangBloc>().state.lang;
    List<EditAdModel> data =
        await CustomerRepository(context).getMyAds(lang, refresh);
    onUpdateAdsList(data);
  }

  setRefreshUserAds(
      BuildContext context, RefreshController refreshController) async {
    await fetchUserAds(context);
    refreshController.refreshCompleted();
  }

  stRemoveMyAd(BuildContext context, EditAdModel model) async {
    var result = await CustomerRepository(context).removeMyAd(model.id);
    if (result) {
      state.ads.remove(model);
      onUpdateAdsList(state.ads);
      AutoRouter.of(context).pop();
      HomeMainData().pagingController.refresh();
    }
  }
}
