import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/core/utils/globa_keys.dart';
import 'package:invoyse_test/navigator/router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Invoyse Test',
          scaffoldMessengerKey: scaffoldMessengerKey,
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
