import 'package:angadiapp/core/network/base_usecase.dart';
import 'package:angadiapp/core/network/failure.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_banners_model.dart';
import 'package:angadiapp/src/features/home_shops/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

  class GetAdBannersUsecase implements BaseUseCase<String,List<GetBannersResponseModel>> {
  final HomeRepository homeRepository;

  GetAdBannersUsecase(this.homeRepository);

  @override
  Future<Either<Failure, List<GetBannersResponseModel>>> execute(String locationId) async {
    return homeRepository.getBanners(
      locationId,
    );
  }
}