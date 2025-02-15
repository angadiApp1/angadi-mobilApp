import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_banners_model.g.dart';

@JsonSerializable()
class GetBannersResponseModel {
  @JsonKey(name: "_id")
  final String id;

  @JsonKey(name: "images")
  final List<String?> images;

  @JsonKey(name: "locationId")
  final String? locationId;

  @JsonKey(name: "locationName")
  final String? locationName;


  GetBannersResponseModel({
    required this.id,
    required this.images,
    required this.locationId,
    required this.locationName,
  });

  factory GetBannersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetBannersResponseModelFromJson(json);
}
