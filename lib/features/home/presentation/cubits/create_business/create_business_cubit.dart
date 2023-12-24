import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:invoyse_test/core/errors/failures.dart';

import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart';
import 'package:invoyse_test/features/home/domain/usecases/create_business_usecase.dart';

part 'create_business_state.dart';

@injectable
class CreateBusinessCubit extends Cubit<CreateBusinessState> {
  final CreateBusinesUsecase createBusinesUsecase;
  CreateBusinessCubit(
    this.createBusinesUsecase,
  ) : super(CreateBusinessInitial());

  Future<void> createBusiness(BusinessInfoEntity businessInfoEntity) async {
    emit(const CreatingBusinesses());

    final result = await createBusinesUsecase(businessInfoEntity);

    result.fold((Failure failure) {
      emit(CreatingBusinessesError(failure.message!));
    }, (_) {
      emit(const CreatedBusinesses());
    });
  }
}
