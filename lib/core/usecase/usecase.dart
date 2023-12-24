import 'package:dartz/dartz.dart';
import 'package:invoyse_test/core/errors/failures.dart';

abstract class UsecaseWithParams<Type, Params> {
  Future<Either<Failure?, Type>>? call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  Future<Either<Failure?, Type>>? call();
}
