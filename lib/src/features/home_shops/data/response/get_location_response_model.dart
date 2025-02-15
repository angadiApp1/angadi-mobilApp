import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_location_response_model.g.dart';

@JsonSerializable()
class GetLocationResponseModel {
  @JsonKey(name: "locations")
  final List<CountryData> locations;

  @JsonKey(name: "statusCode")
  final int statusCode;

  @JsonKey(name: "message")
  final String message;

  GetLocationResponseModel({
    required this.locations,
    required this.statusCode,
    required this.message,
  });

  factory GetLocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetLocationResponseModelFromJson(json);
}

@JsonSerializable()
class CountryData {
  @JsonKey(name: "_id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "states")
  final List<StateData> states;

  CountryData({
    required this.id,
    required this.name,
    required this.states,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);
}

@JsonSerializable()
class StateData {
  @JsonKey(name: "_id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "type")
  final String type;

  @JsonKey(name: "createdDate")
  final String createdDate;

  @JsonKey(name: "districts")
  final List<DistrictData> districts;

  StateData({
    required this.id,
    required this.name,
    required this.type,
    required this.createdDate,
    required this.districts,
  });

  factory StateData.fromJson(Map<String, dynamic> json) =>
      _$StateDataFromJson(json);
}

@JsonSerializable()
class DistrictData {
  @JsonKey(name: "_id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "type")
  final String type;

  @JsonKey(name: "createdDate")
  final String createdDate;

  @JsonKey(name: "locations")
  final List<LocationData> locations;

  DistrictData({
    required this.id,
    required this.name,
    required this.type,
    required this.createdDate,
    required this.locations,
  });

  factory DistrictData.fromJson(Map<String, dynamic> json) =>
      _$DistrictDataFromJson(json);
}

@JsonSerializable()
class LocationData {
  @JsonKey(name: "_id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "type")
  final String type;

  @JsonKey(name: "createdDate")
  final String createdDate;

  LocationData({
    required this.id,
    required this.name,
    required this.type,
    required this.createdDate,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);
}