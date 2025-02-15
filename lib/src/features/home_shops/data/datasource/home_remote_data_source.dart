
import 'package:angadiapp/src/features/home_shops/data/network/home_api_clients.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<GetLocationResponseModel?> getLocationData(
  );

  Future<dynamic> getCategories(
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
  Future<dynamic> getCategories(
  ) async {
    return await _homeServiceClient.getCategories();
  }
}
