// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdsDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsDataModel _$AdsDataModelFromJson(Map<String, dynamic> json) => AdsDataModel(
      id: json['id'] as int,
      title: json['title'] as String,
      video: json['video'] as String,
      date: json['date'] as String,
      userName: json['userName'] as String,
      catId: json['catId'] as int,
      location: json['location'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      countFavorite: json['countFavorite'] as int,
      countComment: json['countComment'] as int,
      showPhone: json['showPhone'] as bool,
      price: json['price'] as num,
      showPrice: json['showPrice'] as bool,
      checkFollows: json['checkFollows'] as bool,
      countReport: json['countReport'] as int,
      checkRate: json['checkRate'] as bool,
      checkWishList: json['checkWishList'] as bool,
      allImg: (json['allImg'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fkUser: json['fkUser'] as String,
      checkReport: json['checkReport'] as bool,
      fromAppOrNo: json['fromAppOrNo'] as bool,
      whatsapp: json['whatsapp'] as String?,
      closeReply: json['closeReply'] as bool,
      showMap: json['showMap'] as bool,
      userPhone: json['userPhone'] as String,
      userRate: json['userRate'] as int,
      locationInfo: json['locationInfo'] as String?,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      km: json['elMamsha'] as int,
      notes: json['notes'] as String?,
      phoneCode: json['phoneCode'] as String?,
    );

Map<String, dynamic> _$AdsDataModelToJson(AdsDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fkUser': instance.fkUser,
      'date': instance.date,
      'userName': instance.userName,
      'catId': instance.catId,
      'location': instance.location,
      'lat': instance.lat,
      'lng': instance.lng,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'userPhone': instance.userPhone,
      'description': instance.description,
      'phoneCode': instance.phoneCode,
      'notes': instance.notes,
      'locationInfo': instance.locationInfo,
      'countFavorite': instance.countFavorite,
      'countComment': instance.countComment,
      'elMamsha': instance.km,
      'showPhone': instance.showPhone,
      'price': instance.price,
      'userRate': instance.userRate,
      'fromAppOrNo': instance.fromAppOrNo,
      'showPrice': instance.showPrice,
      'checkFollows': instance.checkFollows,
      'countReport': instance.countReport,
      'checkRate': instance.checkRate,
      'checkReport': instance.checkReport,
      'checkWishList': instance.checkWishList,
      'closeReply': instance.closeReply,
      'showMap': instance.showMap,
      'video': instance.video,
      'allImg': instance.allImg,
      'comments': instance.comments,
    };
