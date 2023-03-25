import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:orlandev_flutter_portafolio/app/di/di.dart';

import 'app/routes/app_pages.dart';

void main() {
  DependencyInjection.init();
  runApp(

    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
