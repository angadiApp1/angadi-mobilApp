import 'package:angadiapp/core/network/base_usecase.dart';
import 'package:angadiapp/core/network/failure.dart';
import 'package:angadiapp/src/features/home_shops/data/response/fetch_shops_model.dart';
import 'package:angadiapp/src/features/home_shops/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetShopsUsecase implements BaseUseCase<String, GetShopsResponseModel> {
  final HomeRepository homeRepository;

  GetShopsUsecase(this.homeRepository);

  @override
  Future<Either<Failure, GetShopsResponseModel>> execute(String locationId) async {
    return homeRepository.getShops(locationId);
  }
}