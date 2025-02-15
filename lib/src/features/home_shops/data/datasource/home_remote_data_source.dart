
import 'package:angadiapp/src/features/home_shops/data/network/home_api_clients.dart';
import 'package:angadiapp/src/features/home_shops/data/response/fetch_shops_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_banners_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_categories_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<GetLocationResponseModel?> getLocationData(
  );

  Future<dynamic> getCategories(
  );

  Future<List<GetBannersResponseModel>?> getBanners(
    String locationId,
  );

  Future<GetShopsResponseModel?> getShops(
    String locationId,
  );
}



class HomeRemoteDataSourceImpl
    implements HomeRemoteDataSource {
  final HomeServiceClient _homeServiceClient;

  HomeRemoteDataSourceImpl(this._homeServiceClient);

  @override
    Future<GetLocationResponseModel?> getLocationData(
  ) async {
    return await _homeServiceClient.getLocationData();
  }

  @override
  Future<GetCategoriesResponseModel?> getCategories(
  ) async {
    return await _homeServiceClient.getCategories();
  }

  @override
  Future<List<GetBannersResponseModel>?> getBanners(
    String locationId,
  ) async {
    return await _homeServiceClient.getBanners(locationId);
  }

  @override
  Future<GetShopsResponseModel?> getShops(
    String locationId,
  ) async {
    return await _homeServiceClient.getShops(locationId);
  }
}
