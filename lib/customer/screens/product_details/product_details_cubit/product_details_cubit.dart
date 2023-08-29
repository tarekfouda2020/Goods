import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/AdsDetailsModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/screens/product_comments/comment_cubit/comment_cubit.dart';
import 'package:heraggoods/customer/screens/product_details/favourite_cubit/favourite_cubit.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(const ProductDetailsInitial());

  onModelUpdated(
    AdsDetailsModel model,
    FavouriteCubit favouriteCubit,
    CommentCubit commentCubit,
  ) {
    commentCubit.onSetCommentsList(model.adsData.comments);
    favouriteCubit.onUpdateFav(model.adsData.countFavorite,
        model.adsData.checkWishList, model.adsData.checkFollows);
    emit(ProductDetailsUpdated(model, !state.change));
  }

  onUpdateAdsData(AdsDetailsModel model) {
    emit(ProductDetailsUpdated(model, !state.change));
  }

  Future<AdsDetailsModel> fetchAdsDetails(BuildContext context, int id,
      FavouriteCubit favouriteCubit, CommentCubit commentCubit,
      {bool refresh = true}) async {
    String lang = context.read<LangBloc>().state.lang;
    AdsDetailsModel detailsModel =
        await CustomerRepository(context).getAdDetails("$id", lang, refresh);
    onModelUpdated(detailsModel, favouriteCubit, commentCubit);
    return detailsModel;
  }
}
