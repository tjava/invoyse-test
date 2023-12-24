import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:invoyse_test/core/errors/failures.dart';
import 'package:invoyse_test/core/usecase/usecase.dart';
import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart';
import 'package:invoyse_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton()
class GetBusinessesUsecase extends UsecaseWithoutParams<List<BusinessInfoEntity>> {
  final HomeRepository homeRepository;
  GetBusinessesUsecase(
    this.homeRepository,
  );

  @override
  Future<Either<Failure, List<BusinessInfoEntity>>> call() async {
    return homeRepository.getBusinesses();
  }
}
