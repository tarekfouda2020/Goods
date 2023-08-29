// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/AdOwnerModel.dart';
import 'package:heraggoods/customer/models/AdsDetailsModel.dart';
import 'package:heraggoods/customer/models/AdsModel.dart';
import 'package:heraggoods/customer/models/BankModel.dart';
import 'package:heraggoods/customer/models/CommentModel.dart';
import 'package:heraggoods/customer/models/DropDownModel.dart';
import 'package:heraggoods/customer/models/Dtos/AddAdsModel.dart';
import 'package:heraggoods/customer/models/Dtos/AddPayModel.dart';
import 'package:heraggoods/customer/models/Dtos/FilterModel.dart';
import 'package:heraggoods/customer/models/Dtos/UpdateAdModel.dart';
import 'package:heraggoods/customer/models/EditAdModel.dart';
import 'package:heraggoods/customer/models/NotifyModel.dart';
import 'package:heraggoods/customer/models/OffersHeaderModel.dart';
import 'package:heraggoods/customer/models/ReplyModel.dart';
import 'package:heraggoods/customer/models/SearchModel.dart';
import 'package:heraggoods/customer/models/SpecificationHeaderModel.dart';
import 'package:heraggoods/customer/models/UserDetailsModel.dart';
import 'package:heraggoods/customer/models/UserFollowerModel.dart';
import 'package:heraggoods/general/blocs/chat_count_cubit/chat_count_cubit.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:heraggoods/general/blocs/notify_count_cubit/notify_count_cubit.dart';
import 'package:heraggoods/general/blocs/show_pay-cubit/show_pay_cubit.dart';
import 'package:heraggoods/general/blocs/user_cubit/user_cubit.dart';
import 'package:heraggoods/general/constants/GlobalState.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/general/utilities/dio_helper/DioImports.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';

class CustomerAdsMethods {
  final BuildContext context;

  CustomerAdsMethods(this.context);

  Future<List<AdsModel>> getAdsData(FilterModel model, bool refresh) async {
    model.lang = context.read<LangBloc>().state.lang;
    var data = await DioHelper(forceRefresh: refresh, context: context)
        .get("/api/v1/ListAllAdsByFillter", model.toJson());
    if (data != null) {
      context.read<ShowPayCubit>().onUpdateShow(data["showPay"] ?? true);
      context.read<NotifyCountCubit>().onUpdateCount(data["countNotify"] ?? 0);
      context.read<ChatCountCubit>().onUpdateCount(data["countChat"]);
      return List<AdsModel>.from(data["data"].map((e) => AdsModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<DropDownModel>> getRegionData() async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang};
    var data = await DioHelper(forceRefresh: false, context: context)
        .get("/api/v1/ListOfRegoinAsync", body);
    if (data != null) {
      return List<DropDownModel>.from(
          data["data"].map((e) => DropDownModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<DropDownModel>> getCitiesData(String regionId) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "regoinId": regionId};
    var data = await DioHelper(forceRefresh: false, context: context)
        .get("/api/v1/ListOfCitysAsync", body);
    if (data != null) {
      return List<DropDownModel>.from(
          data["data"].map((e) => DropDownModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<DropDownModel>> getNeighborsData(String cityId) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "cityId": cityId};
    var data = await DioHelper(forceRefresh: false, context: context)
        .get("/api/v1/ListOfDistrictsByCityIdAsync", body);
    if (data != null) {
      return List<DropDownModel>.from(
          data["data"].map((e) => DropDownModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<OffersHeaderModel>> getOffersHeaderData(bool refresh) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang};
    debugPrint(body.toString());
    var data = await DioHelper(forceRefresh: refresh, context: context)
        .get("/api/v1/ListOfHeaderAds", body);
    if (data != null) {
      return List<OffersHeaderModel>.from(
          data["data"].map((e) => OffersHeaderModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<SpecificationHeaderModel>> getOffersPropertyData(
      String catId) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "catId": catId,
    };
    debugPrint(body.toString());
    var data = await DioHelper(forceRefresh: false, context: context)
        .get("/api/v1/ListOfSpecifications", body);
    if (data != null) {
      return List<SpecificationHeaderModel>.from(
          data["data"].map((e) => SpecificationHeaderModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> setAddOffer(AddAdsModel model) async {
    var data = await DioHelper(context: context)
        .uploadFile("/api/v1/Add_AdsForAppAsync", model.toJson());
    return data != null ? true : false;
  }

  Future<bool> setEditOffer(UpdateAdModel model) async {
    var data = await DioHelper(context: context)
        .uploadFile("/api/v1/Update_AdsForAppAsync", model.toJson());
    return data != null ? true : false;
  }

  Future<bool> setCloseReply(int id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "adsId": "$id",
    };
    var data = await DioHelper(context: context).get(
      "/api/v1/CloseReplybyAdsId",
      body,
    );
    return data != null ? true : false;
  }

  Future<AdsDetailsModel> getAdDetails(
      String adsId, String lang, bool refresh) async {
    Map<String, dynamic> body = {
      "lang": lang,
      "adsId": adsId,
    };
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get("/api/v1/GetAdsInfo", body);

    return AdsDetailsModel.fromJson(data["data"]);
  }

  Future<List<CommentModel>> getAdComments(
      String adsId, String lang, bool refresh) async {
    Map<String, dynamic> body = {
      "lang": lang,
      "adsId": adsId,
    };
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get("/api/v1/GetAdsCommentInfo", body);
    if (data != null) {
      return List<CommentModel>.from(
          data["data"].map((e) => CommentModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<CommentModel> addAdComments(String adsId, String comment) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "adsId": adsId,
      "comment": comment
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/AddCommentToAdsAsync", body);

    return CommentModel.fromJson(data["commentData"]);
  }

  Future<ReplyModel?> addAdReply(String id, String reply) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "commentId": id, "text": reply};
    var data = await DioHelper(context: context)
        .post("/api/v1/AddReplyForCommentAsync", body);
    return (data != null) ? ReplyModel.fromJson(data["replyData"]) : null;
  }

  Future<bool> removeComment(String id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "commentId": id,
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/RemoveCommentToAdsByIdAsync", body);
    return (data != null);
  }

  Future<bool> removeReply(String id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "commentReplyId": id,
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/RemoveCommentReplyByIdAsync", body);
    return (data != null);
  }

  Future<bool> addToFavourite(String id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "adsId": id,
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/AddItemToWishlist", body);
    return (data != null);
  }

  Future<bool> removeFromFavourite(String id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "adsId": id,
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/RemoveAdsToWishListForSiteAsync", body);
    return (data != null);
  }

  Future<List<AdsModel>> getFavouriteList(String lang) async {
    Map<String, dynamic> body = {"lang": lang};
    var data =
        await DioHelper(context: context).get("/api/v1/ListWishlist", body);
    if (data != null) {
      return List<AdsModel>.from(data["data"].map((e) => AdsModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> addToFollower(String id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "adsId": id,
    };
    var data =
        await DioHelper(context: context).post("/api/v1/AddItemToFollow", body);
    return (data != null);
  }

  Future<bool> removeFromFollower(String id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "AdsId": id,
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/RemoveItemFromFollow", body);
    return data != null;
  }

  Future<bool> addUserToFollower(String userId) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "fkUserFollow": userId,
    };
    var data =
        await DioHelper(context: context).post("/api/v1/AddUserToFollow", body);
    return (data != null);
  }

  Future<bool> addAdsReport(String id, String reason) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "adsId": id, "reason": reason};
    var data =
        await DioHelper(context: context).post("/api/v1/AddReporToAds", body);
    return (data != null);
  }

  Future<UserDetailsModel> getUserAds(
      String userId, String lang, bool refresh) async {
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
    };
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get("/api/v1/ListAdsByUserId", body);

    UserDetailsModel model = UserDetailsModel(
        ads: List<AdsModel>.from(data["data"].map((e) => AdsModel.fromJson(e))),
        userData: AdOwnerModel.fromJson(data["dataUser"]));
    model.userData.showFollow = data["checkFollowOrNo"];
    model.userData.showRate = data["checkrateOrNo"];
    return model;
  }

  Future<List<CommentModel>> getUserComments(String id, bool refresh) async {
    var lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": id,
    };
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get("/api/v1/ListCommentsLikesByUserId", body);
    if (data != null) {
      return List<CommentModel>.from(
          data["data"].map((e) => CommentModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<CommentModel> addUserComments(String adsId, String comment) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": adsId,
      "comment": comment
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/AddCommentToUserAsync", body);

    return CommentModel.fromJson(data["comment"]);
  }

  Future<bool> removeUserComment(String id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "commentId": id,
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/RemoveCommentByIdAsync", body);
    return (data != null);
  }

  Future<List<EditAdModel>> getMyAds(String lang, bool refresh) async {
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var data =
        await DioHelper(forceRefresh: refresh, context: context).get("/api/v1/ListMyAds", body);
    if (data != null) {
      return List<EditAdModel>.from(
          data["data"].map((e) => EditAdModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<CommentModel>> getMyComments(String lang) async {
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var data = await DioHelper(context: context)
        .get("/api/v1/ListCommentsLikesByForMy", body);
    if (data != null) {
      UserModel user = UserModel.fromJson(data["userData"]);
      user.token = GlobalState.instance.get("token");
      await Utils.saveUserData(user);
      context.read<UserCubit>().onUpdateUserData(user);
      return List<CommentModel>.from(
          data["data"].map((e) => CommentModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<int> addUserRate(String userId, int rate) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "userId": userId, "rate": rate};
    var data = await DioHelper(context: context)
        .post("/api/v1/AddRateToUserAsync", body);
    return (data != null) ? data["rate"] : 0;
  }

  Future<List<AdsModel>> getFollowedAds(bool refresh) async {
    var lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get("/api/v1/ListFollowAdsForAppAsync", body);
    if (data != null) {
      return List<AdsModel>.from(
          data["data"].map((e) => AdsModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> removeFollowAd(String id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "AdsId": id,
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/RemoveFollowByIdForWebsiteAsync", body);
    return (data != null);
  }

  Future<List<UserFollowerModel>> getFollowedUsers(bool refresh) async {
    var lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get("/api/v1/ListFollowUserForAppAsync", body);
    if (data != null) {
      return List<UserFollowerModel>.from(
          data["data"].map((e) => UserFollowerModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> removeFollowUser(String id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "followID": id,
    };
    var data = await DioHelper(context: context)
        .post("/api/v1/RemoveItemFromFollow", body);
    return (data != null);
  }

  Future<List<SearchModel>> getSearchAds(String text) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "text": text,
    };
    var data = await DioHelper(context: context, forceRefresh: false)
        .get("/api/v1/SearchInBranch", body);
    if (data != null) {
      return List<SearchModel>.from(
          data["data"].map((e) => SearchModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<NotifyModel>> getNotifications(String lang, bool refresh) async {
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get("/api/v1/ListOfNotify", body);
    if (data != null) {
      return List<NotifyModel>.from(
          data["notify"].map((e) => NotifyModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> removeNotification(int id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "notifyId": "$id"};
    var data = await DioHelper(context: context)
        .post("/api/v1/RemoveNotiyByIdAsync", body);
    return (data != null);
  }

  Future<bool> removeNotifications() async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var data =
        await DioHelper(context: context).post("/api/v1/RemoveAllNotiy", body);
    return (data != null);
  }

  Future<bool> removeMyAd(int id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "adsId": "$id"};
    var data =
        await DioHelper(context: context).post("/api/v1/ReomveAdsById", body);
    return (data != null);
  }

  Future<bool> removeAdImage(int id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "ImgId": "$id"};
    var data =
        await DioHelper(context: context).post("/api/v1/ReomveImgId", body);
    return (data != null);
  }

  Future<bool> addPayment(AddPayModel model) async {
    var data = await DioHelper(context: context)
        .uploadFile("/api/v1/AddBankTransferAsync", model.toJson());
    return (data != null);
  }

  Future<List<BankModel>> getBanks() async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var data =
        await DioHelper(context: context).get("/api/v1/ListBanks", body);
    if (data != null) {
      return List<BankModel>.from(
          data["data"].map((e) => BankModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> refreshMyAd(int id) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "adsId": "$id",
    };
    var data =
        await DioHelper(context: context).post("/api/v1/RefreshAdsAsync", body);
    return (data != null);
  }
}
