import 'package:angadiapp/core/network/base_usecase.dart';
import 'package:angadiapp/core/network/failure.dart';
import 'package:angadiapp/src/features/home_shops/data/response/shop_offers_model.dart';
import 'package:angadiapp/src/features/home_shops/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetShopOffersUsecase
    implements BaseUseCase<String, ShopOffersResponseModel> {
  final HomeRepository homeRepository;

  GetShopOffersUsecase(this.homeRepository);

  @override
  Future<Either<Failure, ShopOffersResponseModel>> execute(
      String shopId) async {
    return homeRepository.getShopOffers(shopId);
  }
}
