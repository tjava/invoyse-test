import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:invoyse_test/core/errors/failures.dart';
import 'package:invoyse_test/core/usecase/usecase.dart';
import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart';
import 'package:invoyse_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton()
class CreateBusinesUsecase extends UsecaseWithParams<bool, BusinessInfoEntity> {
  final HomeRepository homeRepository;
  CreateBusinesUsecase(
    this.homeRepository,
  );

  @override
  Future<Either<Failure, bool>> call(BusinessInfoEntity params) async {
    return await homeRepository.createBusiness(params);
  }
}
