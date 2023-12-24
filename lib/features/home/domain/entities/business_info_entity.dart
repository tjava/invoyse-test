import 'package:equatable/equatable.dart';

class BusinessInfoEntity extends Equatable {
  final String uuid;
  final String businessName;
  final String businessEmail;
  final String businessPhone;
  final String businessAddress;
  final String? businessLogo;
  final String? businessCategory;
  final String? businessNaira;
  final DateTime? createdAt;

  const BusinessInfoEntity({
    required this.uuid,
    required this.businessName,
    required this.businessEmail,
    required this.businessPhone,
    required this.businessAddress,
    this.businessLogo,
    this.businessCategory,
    this.businessNaira,
    this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      uuid,
      businessName,
      businessEmail,
      businessPhone,
      businessAddress,
      businessLogo,
      businessCategory,
      businessNaira,
      createdAt,
    ];
  }
}
