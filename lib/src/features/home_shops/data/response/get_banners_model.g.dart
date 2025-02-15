// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_banners_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBannersResponseModel _$GetBannersResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetBannersResponseModel(
      id: json['_id'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String?).toList(),
      locationId: json['locationId'] as String?,
      locationName: json['locationName'] as String?,
    );

Map<String, dynamic> _$GetBannersResponseModelToJson(
        GetBannersResponseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'images': instance.images,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
    };
