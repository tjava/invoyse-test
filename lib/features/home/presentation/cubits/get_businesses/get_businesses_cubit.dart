import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:invoyse_test/core/errors/failures.dart';

import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart';
import 'package:invoyse_test/features/home/domain/usecases/get_posts_usecase.dart';

part 'get_businesses_state.dart';

@injectable
class GetBusinessesCubit extends Cubit<GetBusinessesState> {
  final GetBusinessesUsecase getBusinessesUsecase;
  GetBusinessesCubit(
    this.getBusinessesUsecase,
  ) : super(GetBusinessesInitial());

  Future<void> getBusinesses() async {
    emit(const LoadingBusinesses());

    final result = await getBusinessesUsecase();

    result.fold((Failure failure) {
      emit(LoadingBusinessesError(failure.message!));
    }, (List<BusinessInfoEntity> listBusinessEntity) {
      emit(LoadedBusinesses(listBusinessEntity));
    });
  }
}
