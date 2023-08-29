// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BankModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankModel _$BankModelFromJson(Map<String, dynamic> json) => BankModel(
      id: json['id'] as int,
      img: json['img'] as String,
      accountNumber: json['accountNumber'] as String,
      ibandNumber: json['ibandNumber'] as String,
      name: json['bannkName'] as String,
      beneficiaryName: json['beneficiaryName'] as String,
    );

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'accountNumber': instance.accountNumber,
      'ibandNumber': instance.ibandNumber,
      'bannkName': instance.name,
      'beneficiaryName': instance.beneficiaryName,
    };
