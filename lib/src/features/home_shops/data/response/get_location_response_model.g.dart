// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_location_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLocationResponseModel _$GetLocationResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetLocationResponseModel(
      locations: (json['locations'] as List<dynamic>)
          .map((e) => CountryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetLocationResponseModelToJson(
        GetLocationResponseModel instance) =>
    <String, dynamic>{
      'locations': instance.locations,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

CountryData _$CountryDataFromJson(Map<String, dynamic> json) => CountryData(
      id: json['_id'] as String,
      name: json['name'] as String,
      states: (json['states'] as List<dynamic>)
          .map((e) => StateData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'states': instance.states,
    };

StateData _$StateDataFromJson(Map<String, dynamic> json) => StateData(
      id: json['_id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      createdDate: json['createdDate'] as String,
      districts: (json['districts'] as List<dynamic>)
          .map((e) => DistrictData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StateDataToJson(StateData instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'createdDate': instance.createdDate,
      'districts': instance.districts,
    };

DistrictData _$DistrictDataFromJson(Map<String, dynamic> json) => DistrictData(
      id: json['_id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      createdDate: json['createdDate'] as String,
      locations: (json['locations'] as List<dynamic>)
          .map((e) => LocationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DistrictDataToJson(DistrictData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'createdDate': instance.createdDate,
      'locations': instance.locations,
    };

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      id: json['_id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'createdDate': instance.createdDate,
    };
