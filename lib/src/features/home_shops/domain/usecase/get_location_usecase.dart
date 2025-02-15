import 'package:angadiapp/core/network/base_usecase.dart';
import 'package:angadiapp/core/network/failure.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:angadiapp/src/features/home_shops/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetLocationUsecase implements BaseUseCaseWithNoInput<GetLocationResponseModel?> {
  final HomeRepository homeRepository;

  GetLocationUsecase(this.homeRepository);

  @override
  Future<Either<Failure, GetLocationResponseModel?>> execute() async {
    return homeRepository.getLocationData(
    );
  }
}

