// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:invoyse_test/features/home/domain/entities/business_info_entity.dart'
    as _i7;
import 'package:invoyse_test/features/home/presentation/pages/add_business_page.dart'
    as _i1;
import 'package:invoyse_test/features/home/presentation/pages/business_branding_page.dart'
    as _i2;
import 'package:invoyse_test/features/home/presentation/pages/business_information_page.dart'
    as _i3;
import 'package:invoyse_test/features/home/presentation/pages/home_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddBusinessRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddBusinessPage(),
      );
    },
    BusinessBrandingRoute.name: (routeData) {
      final args = routeData.argsAs<BusinessBrandingRouteArgs>(
          orElse: () => const BusinessBrandingRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BusinessBrandingPage(
          key: args.key,
          businessInfoEntity: args.businessInfoEntity,
        ),
      );
    },
    BusinessInformationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BusinessInformationPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddBusinessPage]
class AddBusinessRoute extends _i5.PageRouteInfo<void> {
  const AddBusinessRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddBusinessRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBusinessRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BusinessBrandingPage]
class BusinessBrandingRoute
    extends _i5.PageRouteInfo<BusinessBrandingRouteArgs> {
  BusinessBrandingRoute({
    _i6.Key? key,
    _i7.BusinessInfoEntity? businessInfoEntity,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          BusinessBrandingRoute.name,
          args: BusinessBrandingRouteArgs(
            key: key,
            businessInfoEntity: businessInfoEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'BusinessBrandingRoute';

  static const _i5.PageInfo<BusinessBrandingRouteArgs> page =
      _i5.PageInfo<BusinessBrandingRouteArgs>(name);
}

class BusinessBrandingRouteArgs {
  const BusinessBrandingRouteArgs({
    this.key,
    this.businessInfoEntity,
  });

  final _i6.Key? key;

  final _i7.BusinessInfoEntity? businessInfoEntity;

  @override
  String toString() {
    return 'BusinessBrandingRouteArgs{key: $key, businessInfoEntity: $businessInfoEntity}';
  }
}

/// generated route for
/// [_i3.BusinessInformationPage]
class BusinessInformationRoute extends _i5.PageRouteInfo<void> {
  const BusinessInformationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          BusinessInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BusinessInformationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
