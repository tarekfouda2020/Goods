// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/AdsModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/screens/home/homeTabs/favourite/wish_list_cubit/wish_list_cubit.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(const FavouriteInitial());

  onUpdateFav(int count, bool fav, bool follow) {
    emit(FavouriteUpdated(fav, follow, count));
  }

  setAddToFavourite(BuildContext context, AdsModel adsModel) async {
    bool result =
        await CustomerRepository(context).addToFavourite("${adsModel.id}");
    if (result) {
      List<AdsModel> ads = context.read<WishListCubit>().state.ads;
      ads.insert(0, adsModel);
      context.read<WishListCubit>().onUpdateFavList(ads);
      onUpdateFav(state.count + 1, true, state.follow);
    }
  }

  setRemoveFavourite(BuildContext context, AdsModel adsModel) async {
    bool result =
        await CustomerRepository(context).removeFromFavourite("${adsModel.id}");
    if (result) {
      List<AdsModel> ads = context.read<WishListCubit>().state.ads;
      ads.removeWhere((element) => element.id == adsModel.id);
      context.read<WishListCubit>().onUpdateFavList(ads);
      onUpdateFav(state.count - 1, false, state.follow);
    }
  }

  setAddToFollower(BuildContext context, int id) async {
    if (!state.follow) {
      bool result = await CustomerRepository(context).addToFollower("$id");
      if (result) {
        onUpdateFav(state.count, state.fav, true);
      }
    } else {
      var result =
          await CustomerRepository(context).removeFollowAd(id.toString());
      if (result) {
        onUpdateFav(state.count, state.fav,false);
      }
    }
  }
}
