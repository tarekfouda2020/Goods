 import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/AdsModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());

  onUpdateFavList(List<AdsModel> lst){
    emit(WishListUpdated(ads: lst,changed: !state.changed));
  }

  setFetchFavList(BuildContext context)async{
    var lang=context.read<LangBloc>().state.lang;
    List<AdsModel> lst= await CustomerRepository(context).getFavouriteList(lang);
    onUpdateFavList(lst);
  }

  setRefreshData(BuildContext context,RefreshController refreshController)async{
    var lang=context.read<LangBloc>().state.lang;
    List<AdsModel> lst= await CustomerRepository(context).getFavouriteList(lang);
    onUpdateFavList(lst);
    refreshController.refreshCompleted();
  }

}
