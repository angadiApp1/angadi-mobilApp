import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_categories_model.g.dart';

@JsonSerializable()
class GetCategoriesResponseModel {
  @JsonKey(name: "categories")
  final List<CategoryData> categories;

  @JsonKey(name: "statusCode")
  final int statusCode;

  GetCategoriesResponseModel({
    required this.categories,
    required this.statusCode,
  });

  factory GetCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesResponseModelFromJson(json);
}

@JsonSerializable()
class CategoryData {
  @JsonKey(name: "_id")
  final String id;

  @JsonKey(name: "Name")
  final String name;

  CategoryData({
    required this.id,
    required this.name,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}
