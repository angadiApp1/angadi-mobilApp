// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_shops_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetShopsResponseModel _$GetShopsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetShopsResponseModel(
      shops: (json['shops'] as List<dynamic>)
          .map((e) => ShopData.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$GetShopsResponseModelToJson(
        GetShopsResponseModel instance) =>
    <String, dynamic>{
      'shops': instance.shops,
      'statusCode': instance.statusCode,
    };

ShopData _$ShopDataFromJson(Map<String, dynamic> json) => ShopData(
      name: json['Name'] as String,
      id: json['_id'] as String,
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      countryId: json['countryId'] as String,
      countryName: json['countryName'] as String,
      createdDate: json['cratedDate'] as String,
      districtId: json['districtId'] as String,
      districtName: json['districtName'] as String,
      landmark: json['landmark'] as String,
      locationId: json['locationId'] as String,
      locationName: json['locationName'] as String,
      logo: json['logo'] as String,
      mobile: json['mobile'] as String,
      password: json['password'] as String,
      paymentCompleted: json['paymentCompleted'] as bool,
      stateId: json['stateId'] as String,
      stateName: json['stateName'] as String,
      thumbnail: json['thumbnail'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$ShopDataToJson(ShopData instance) => <String, dynamic>{
      'Name': instance.name,
      '_id': instance.id,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'cratedDate': instance.createdDate,
      'districtId': instance.districtId,
      'districtName': instance.districtName,
      'landmark': instance.landmark,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'logo': instance.logo,
      'mobile': instance.mobile,
      'password': instance.password,
      'paymentCompleted': instance.paymentCompleted,
      'stateId': instance.stateId,
      'stateName': instance.stateName,
      'thumbnail': instance.thumbnail,
      'userName': instance.userName,
    };
