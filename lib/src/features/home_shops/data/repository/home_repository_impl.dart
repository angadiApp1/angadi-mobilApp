import 'package:angadiapp/core/network/failure.dart';
import 'package:angadiapp/src/features/home_shops/data/datasource/home_remote_data_source.dart';
import 'package:angadiapp/src/features/home_shops/data/response/fetch_shops_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_banners_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_categories_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/shop_offers_model.dart';
import 'package:angadiapp/src/features/home_shops/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, GetLocationResponseModel>> getLocationData() async {
    try {
      final response = await _homeRemoteDataSource.getLocationData();
      if (response == null) {
        return Left(Failure(message: response?.message ?? "error"));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetCategoriesResponseModel>> getCategories() async {
    try {
      final response = await _homeRemoteDataSource.getCategories();
      if (response == null) {
        return Left(Failure(message: response?.message ?? "error"));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetBannersResponseModel>>> getBanners(
      String locationId) async {
    try {
      final response = await _homeRemoteDataSource.getBanners(locationId);
      if (response == null) {
        return Left(Failure(message: "error"));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetShopsResponseModel>> getShops(
      String locationId) async {
    try {
      final response = await _homeRemoteDataSource.getShops(locationId);
      if (response == null) {
        return Left(Failure(message: "error"));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShopOffersResponseModel>> getShopOffers(
      String shopId) async {
    try {
      final response = await _homeRemoteDataSource.getShopOffers(shopId);
      if (response == null) {
        return Left(Failure(message: "error"));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
