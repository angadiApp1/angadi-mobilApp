// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopOffersResponseModel _$ShopOffersResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShopOffersResponseModel(
      message: json['message'] as String,
      offers: (json['offers'] as List<dynamic>)
          .map((e) => ShopOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ShopOffersResponseModelToJson(
        ShopOffersResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'offers': instance.offers,
      'statusCode': instance.statusCode,
    };

ShopOffer _$ShopOfferFromJson(Map<String, dynamic> json) => ShopOffer(
      name: json['Name'] as String,
      id: json['_id'] as String,
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      countryId: json['countryId'] as String,
      countryName: json['countryName'] as String,
      cratedDate: json['cratedDate'] as String,
      districtId: json['districtId'] as String,
      districtName: json['districtName'] as String,
      landmark: json['landmark'] as String?,
      locationId: json['locationId'] as String,
      locationName: json['locationName'] as String,
      logo: json['logo'] as String?,
      mobile: json['mobile'] as String?,
      offers: (json['offers'] as List<dynamic>)
          .map((e) => OfferDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      password: json['password'] as String?,
      paymentCompleted: json['paymentCompleted'] as bool?,
      stateId: json['stateId'] as String,
      stateName: json['stateName'] as String,
      thumbnail: json['thumbnail'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$ShopOfferToJson(ShopOffer instance) => <String, dynamic>{
      'Name': instance.name,
      '_id': instance.id,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'cratedDate': instance.cratedDate,
      'districtId': instance.districtId,
      'districtName': instance.districtName,
      'landmark': instance.landmark,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'logo': instance.logo,
      'mobile': instance.mobile,
      'offers': instance.offers,
      'password': instance.password,
      'paymentCompleted': instance.paymentCompleted,
      'stateId': instance.stateId,
      'stateName': instance.stateName,
      'thumbnail': instance.thumbnail,
      'userName': instance.userName,
    };

OfferDetail _$OfferDetailFromJson(Map<String, dynamic> json) => OfferDetail(
      id: json['id'] as String,
      offerEndsIn: json['offerEndsIn'] as String,
      poster: json['poster'] as String,
    );

Map<String, dynamic> _$OfferDetailToJson(OfferDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'offerEndsIn': instance.offerEndsIn,
      'poster': instance.poster,
    };
