// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContactModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
      phone: json['phone'] as String,
      address: json['address'] as String?,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'email': instance.email,
    };
