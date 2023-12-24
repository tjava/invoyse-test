import 'package:dartz/dartz.dart';
import 'package:invoyse_test/core/errors/failures.dart';
import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, bool>> createBusiness(BusinessInfoEntity businessInfoEntity);
  Future<Either<Failure, List<BusinessInfoEntity>>> getBusinesses();
}
