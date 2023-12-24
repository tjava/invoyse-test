import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoyse_test/core/constants/colors_constant.dart';
import 'package:invoyse_test/features/home/presentation/cubits/create_business/create_business_cubit.dart';
import 'package:invoyse_test/features/home/presentation/widgets/tab_nav.dart';
import 'package:invoyse_test/locator/locate.dart';
import 'package:invoyse_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class AddBusinessPage extends StatefulWidget {
  const AddBusinessPage({super.key});

  @override
  State<AddBusinessPage> createState() => _AddBusinessPageState();
}

class _AddBusinessPageState extends State<AddBusinessPage> {
  late CreateBusinessCubit _createBusinessCubit;

  @override
  void initState() {
    super.initState();
    _createBusinessCubit = locate<CreateBusinessCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _createBusinessCubit,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: white,
          body: AutoTabsRouter.tabBar(
            physics: const NeverScrollableScrollPhysics(),
            routes: [
              const BusinessInformationRoute(),
              BusinessBrandingRoute(),
            ],
            builder: (context, child, controller) {
              return Column(
                children: [
                  TabNav(controller: controller),
                  Expanded(child: child),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
