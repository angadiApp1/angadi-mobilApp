import 'package:angadiapp/core/constants/app_details.dart';
import 'package:angadiapp/src/features/home_shops/data/network/home_endpoints.dart';
import 'package:angadiapp/src/features/home_shops/data/response/fetch_shops_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_banners_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_categories_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/shop_offers_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'home_api_clients.g.dart';

@RestApi(baseUrl: AppDetails.baseUrl)
abstract class HomeServiceClient {
  factory HomeServiceClient(Dio dio, {String baseUrl}) = _HomeServiceClient;

  @GET(HomeEndpoints.GET_LOCATION_DATA)
  Future<GetLocationResponseModel?> getLocationData();

  @GET(HomeEndpoints.GET_CATEGORIES)
  Future<GetCategoriesResponseModel?> getCategories();

  @GET(HomeEndpoints.GET_BANNERS)
  Future<List<GetBannersResponseModel>?> getBanners(
    @Query("locationId") String locationId,
  );

  @GET(HomeEndpoints.GET_SHOPS)
  Future<GetShopsResponseModel?> getShops(
    @Query("locationId") String locationId,
  );

  @GET('${HomeEndpoints.GET_OFFERS}/{shopId}')
  Future<ShopOffersResponseModel?> getShopOffers(
    @Path("shopId") String userId,
  );
}
