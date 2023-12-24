import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:invoyse_test/core/errors/exceptions.dart';
import 'package:invoyse_test/core/errors/failures.dart';
import 'package:invoyse_test/features/home/data/datasources/home_remote_datasource.dart';
import 'package:invoyse_test/features/home/data/models/business_info_model.dart';
import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart';
import 'package:invoyse_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;

  HomeRepositoryImpl(this.homeRemoteDatasource);

  @override
  Future<Either<Failure, bool>> createBusiness(BusinessInfoEntity businessInfoEntity) async {
    try {
      await homeRemoteDatasource.createBusiness(BusinessInfoModel(
        uuid: businessInfoEntity.uuid,
        businessName: businessInfoEntity.businessName,
        businessEmail: businessInfoEntity.businessEmail,
        businessPhone: businessInfoEntity.businessPhone,
        businessAddress: businessInfoEntity.businessAddress,
        businessLogo: businessInfoEntity.businessLogo,
        businessCategory: businessInfoEntity.businessCategory,
        businessNaira: businessInfoEntity.businessNaira,
        createdAt: businessInfoEntity.createdAt,
      ));

      return const Right<Failure, bool>(true);
    } on CacheException catch (error) {
      return Left<Failure, bool>(GenericFailure(
        message: error.message,
      ));
    }
  }

  @override
  Future<Either<Failure, List<BusinessInfoEntity>>> getBusinesses() async {
    try {
      final List<BusinessInfoEntity> listBusinessInfoEntity =
          await homeRemoteDatasource.getBusinesses();

      return Right<Failure, List<BusinessInfoEntity>>(listBusinessInfoEntity);
    } on CacheException catch (error) {
      return Left<Failure, List<BusinessInfoEntity>>(GenericFailure(
        message: error.message,
      ));
    }
  }
}
