import 'package:injectable/injectable.dart';
import 'package:invoyse_test/core/errors/exceptions.dart';
import 'package:invoyse_test/features/home/data/models/business_info_model.dart';
import 'package:invoyse_test/features/home/home_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeRemoteDatasource {
  Future<bool> createBusiness(BusinessInfoModel businessInfoModel);
  Future<List<BusinessInfoModel>> getBusinesses();
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final SharedPreferences sharedPreferences;
  HomeRemoteDatasourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<List<BusinessInfoModel>> getBusinesses() async {
    try {
      List<BusinessInfoModel> listBusinessInfoModel = [];
      final String? data = sharedPreferences.getString(kBusinessesInfoKey);

      if (data != null) {
        listBusinessInfoModel.addAll(businessInfoModelFromJson(data));
      }
      return listBusinessInfoModel;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> createBusiness(BusinessInfoModel businessInfoModel) async {
    try {
      List<BusinessInfoModel> listBusinessInfoModel = [];
      final String? data = sharedPreferences.getString(kBusinessesInfoKey);

      if (data != null) {
        listBusinessInfoModel.addAll(businessInfoModelFromJson(data));
      }

      listBusinessInfoModel.add(businessInfoModel);

      return await sharedPreferences.setString(
        kBusinessesInfoKey,
        listBusinessInfoModelToJson(listBusinessInfoModel),
      );
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
