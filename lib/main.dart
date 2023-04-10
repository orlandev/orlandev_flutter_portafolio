import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orlandev_flutter_portafolio/app_bindings.dart';
import 'package:orlandev_flutter_portafolio/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
      title: "Orlando Portfolio",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
      themeMode: ThemeMode.system,
      darkTheme: AppTheme().dark,
      theme: AppTheme().dark));
}
