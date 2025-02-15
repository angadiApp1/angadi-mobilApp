// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesResponseModel _$GetCategoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesResponseModel(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$GetCategoriesResponseModelToJson(
        GetCategoriesResponseModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'statusCode': instance.statusCode,
    };

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
      id: json['_id'] as String,
      name: json['Name'] as String,
    );

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'Name': instance.name,
    };
