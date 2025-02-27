import 'package:json_annotation/json_annotation.dart';

part 'shop_offers_model.g.dart';

@JsonSerializable()
class ShopOffersResponseModel {
  final String message;
  final List<ShopOffer> offers;
  final int statusCode;

  ShopOffersResponseModel({
    required this.message,
    required this.offers,
    required this.statusCode,
  });

  factory ShopOffersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShopOffersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopOffersResponseModelToJson(this);
}

@JsonSerializable()
class ShopOffer {
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: '_id')
  final String id;
  final String categoryId;
  final String categoryName;
  final String countryId;
  final String countryName;
  final String cratedDate;
  final String districtId;
  final String districtName;
  final String landmark;
  final String locationId;
  final String locationName;
  final String logo;
  final String mobile;
  final List<OfferDetail> offers;
  final String password;
  final bool paymentCompleted;
  final String stateId;
  final String stateName;
  final String thumbnail;
  final String userName;

  ShopOffer({
    required this.name,
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.countryId,
    required this.countryName,
    required this.cratedDate,
    required this.districtId,
    required this.districtName,
    required this.landmark,
    required this.locationId,
    required this.locationName,
    required this.logo,
    required this.mobile,
    required this.offers,
    required this.password,
    required this.paymentCompleted,
    required this.stateId,
    required this.stateName,
    required this.thumbnail,
    required this.userName,
  });

  factory ShopOffer.fromJson(Map<String, dynamic> json) =>
      _$ShopOfferFromJson(json);

  Map<String, dynamic> toJson() => _$ShopOfferToJson(this);
}

@JsonSerializable()
class OfferDetail {
  final String id;
  final String offerEndsIn;
  final String poster;

  OfferDetail({
    required this.id,
    required this.offerEndsIn,
    required this.poster,
  });

  factory OfferDetail.fromJson(Map<String, dynamic> json) =>
      _$OfferDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OfferDetailToJson(this);
}
