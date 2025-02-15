
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:angadiapp/core/network/failure.dart';
abstract interface class HomeRepository {
  Future<Either<Failure, GetLocationResponseModel?>> getLocationData();
  Future<Either<Failure, dynamic>> getCategories();
}
