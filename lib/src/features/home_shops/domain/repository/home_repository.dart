
import 'package:angadiapp/src/features/home_shops/data/response/fetch_shops_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_banners_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_categories_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:angadiapp/core/network/failure.dart';
abstract interface class HomeRepository {
  Future<Either<Failure, GetLocationResponseModel>> getLocationData();
  Future<Either<Failure, GetCategoriesResponseModel>> getCategories();
  Future<Either<Failure, List<GetBannersResponseModel>>> getBanners(String locationId);
  Future<Either<Failure, GetShopsResponseModel>> getShops(String locationId);
}
