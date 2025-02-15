import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_shops_model.g.dart';

@JsonSerializable()
class GetShopsResponseModel {

  @JsonKey(name: "shops")
  final List<ShopData> shops;

  @JsonKey(name: "statusCode")
  final int statusCode;

  GetShopsResponseModel({
    required this.shops,
    required this.statusCode,
  });

  factory GetShopsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetShopsResponseModelFromJson(json);
}

@JsonSerializable()
class ShopData {
  @JsonKey(name: "Name")
  final String name;

  @JsonKey(name: "_id") 
  final String id;

  @JsonKey(name: "categoryId")
  final String categoryId;

  @JsonKey(name: "categoryName")
  final String categoryName;

  @JsonKey(name: "countryId")
  final String countryId;

  @JsonKey(name: "countryName") 
  final String countryName;

  @JsonKey(name: "cratedDate")
  final String createdDate;

  @JsonKey(name: "districtId")
  final String districtId;

  @JsonKey(name: "districtName")
  final String districtName;

  @JsonKey(name: "landmark")
  final String landmark;

  @JsonKey(name: "locationId")
  final String locationId;

  @JsonKey(name: "locationName")
  final String locationName;

  @JsonKey(name: "logo")
  final String logo;

  @JsonKey(name: "mobile")
  final String mobile;

  @JsonKey(name: "password")
  final String password;

  @JsonKey(name: "paymentCompleted")
  final bool paymentCompleted;

  @JsonKey(name: "stateId")
  final String stateId;

  @JsonKey(name: "stateName")
  final String stateName;

  @JsonKey(name: "thumbnail")
  final String thumbnail;

  @JsonKey(name: "userName")
  final String userName;

  ShopData({
    required this.name,
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.countryId,
    required this.countryName,
    required this.createdDate,
    required this.districtId,
    required this.districtName,
    required this.landmark,
    required this.locationId,
    required this.locationName,
    required this.logo,
    required this.mobile,
    required this.password,
    required this.paymentCompleted,
    required this.stateId,
    required this.stateName,
    required this.thumbnail,
    required this.userName,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) =>
      _$ShopDataFromJson(json);
}