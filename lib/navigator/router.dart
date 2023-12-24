import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      initial: true,
    ),
    AutoRoute(
      page: AddBusinessRoute.page,
      path: '/addBusiness',
      children: [
        AutoRoute(
          page: BusinessInformationRoute.page,
          path: '',
        ),
        AutoRoute(
          page: BusinessBrandingRoute.page,
          path: 'businessBranding',
        ),
      ],
    ),
  ];
}
