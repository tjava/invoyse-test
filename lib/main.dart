import 'package:flutter/material.dart';
import 'package:invoyse_test/locator/locate.dart';
import 'package:invoyse_test/main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MainApp());
}
