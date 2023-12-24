// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:invoyse_test/core/services/third_party_services_module.dart'
    as _i11;
import 'package:invoyse_test/features/home/data/datasources/home_remote_datasource.dart'
    as _i4;
import 'package:invoyse_test/features/home/data/repositories/home_repository_impl.dart'
    as _i6;
import 'package:invoyse_test/features/home/domain/repositories/home_repository.dart'
    as _i5;
import 'package:invoyse_test/features/home/domain/usecases/create_business_usecase.dart'
    as _i7;
import 'package:invoyse_test/features/home/domain/usecases/get_posts_usecase.dart'
    as _i9;
import 'package:invoyse_test/features/home/presentation/cubits/create_business/create_business_cubit.dart'
    as _i8;
import 'package:invoyse_test/features/home/presentation/cubits/get_businesses/get_businesses_cubit.dart'
    as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  await gh.lazySingletonAsync<_i3.SharedPreferences>(
    () => thirdPartyServicesModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i4.HomeRemoteDatasource>(() => _i4.HomeRemoteDatasourceImpl(
      sharedPreferences: gh<_i3.SharedPreferences>()));
  gh.lazySingleton<_i5.HomeRepository>(
      () => _i6.HomeRepositoryImpl(gh<_i4.HomeRemoteDatasource>()));
  gh.lazySingleton<_i7.CreateBusinesUsecase>(
      () => _i7.CreateBusinesUsecase(gh<_i5.HomeRepository>()));
  gh.factory<_i8.CreateBusinessCubit>(
      () => _i8.CreateBusinessCubit(gh<_i7.CreateBusinesUsecase>()));
  gh.lazySingleton<_i9.GetBusinessesUsecase>(
      () => _i9.GetBusinessesUsecase(gh<_i5.HomeRepository>()));
  gh.factory<_i10.GetBusinessesCubit>(
      () => _i10.GetBusinessesCubit(gh<_i9.GetBusinessesUsecase>()));
  return getIt;
}

class _$ThirdPartyServicesModule extends _i11.ThirdPartyServicesModule {}
