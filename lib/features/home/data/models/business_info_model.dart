import 'dart:convert';

import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart';

List<BusinessInfoModel> businessInfoModelFromJson(String str) =>
    List<BusinessInfoModel>.from(json.decode(str).map((x) => BusinessInfoModel.fromJson(x)));

String businessInfoModelToJson(List<BusinessInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String listBusinessInfoModelToJson(List<BusinessInfoModel> data) {
  List<Map<String, dynamic>> newList = [];
  for (var element in data) {
    newList.add(element.toJson());
  }
  return json.encode(newList);
}

class BusinessInfoModel extends BusinessInfoEntity {
  const BusinessInfoModel({
    required super.uuid,
    required super.businessName,
    required super.businessEmail,
    required super.businessPhone,
    required super.businessAddress,
    super.businessLogo,
    super.businessCategory,
    super.businessNaira,
    super.createdAt,
  });

  factory BusinessInfoModel.fromJson(Map<String, dynamic> json) => BusinessInfoModel(
        uuid: json["uuid"],
        businessName: json["businessName"],
        businessEmail: json["businessEmail"],
        businessPhone: json["businessPhone"],
        businessAddress: json["businessAddress"],
        businessLogo: json["businessLogo"],
        businessCategory: json["businessCategory"],
        businessNaira: json["businessNaira"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "businessName": businessName,
        "businessEmail": businessEmail,
        "businessPhone": businessPhone,
        "businessAddress": businessAddress,
        "businessLogo": businessLogo,
        "businessCategory": businessCategory,
        "businessNaira": businessNaira,
        "createdAt": createdAt.toString(),
      };
}
