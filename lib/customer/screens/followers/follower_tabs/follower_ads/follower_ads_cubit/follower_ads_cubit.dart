// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/AdsModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';

part 'follower_ads_state.dart';

class FollowerAdsCubit extends Cubit<FollowerAdsState> {
  FollowerAdsCubit() : super(FollowerAdsInitial());

  onUpdateAdsList(List<AdsModel> ads){
    emit(FollowerAdsUpdated(ads, !state.change));
  }

  fetchUserAds(BuildContext context,{bool refresh = true})async{
    List<AdsModel> data = await CustomerRepository(context).getFollowedAds(refresh);
    onUpdateAdsList(data);
  }

  removeFollowAd(BuildContext context,AdsModel model)async{
    var result = await CustomerRepository(context).removeFollowAd(model.id.toString());
    if(result){
      AutoRouter.of(context).pop();
      state.ads.remove(model);
      onUpdateAdsList(state.ads);
    }
  }

}
