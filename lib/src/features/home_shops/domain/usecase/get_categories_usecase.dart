import 'package:angadiapp/core/network/base_usecase.dart';
import 'package:angadiapp/core/network/failure.dart';
import 'package:angadiapp/src/features/home_shops/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesUsecase implements BaseUseCaseWithNoInput<dynamic> {
  final HomeRepository homeRepository;

  GetCategoriesUsecase(this.homeRepository);

  @override
  Future<Either<Failure, dynamic>> execute() async {
    return homeRepository.getCategories(
    );
  }
}
