import 'package:angadiapp/core/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

abstract interface class BaseUseCaseWithNoInput<Out> {
  Future<Either<Failure, Out>> execute();
}