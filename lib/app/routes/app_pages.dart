import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/portfolio_detail/bindings/portfolio_binding.dart';
import '../modules/portfolio_detail/views/portfolio_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PORTFOLIO_HOME,
      page: () => const PortfolioView(),
      binding: PortfolioBinding(),
    ),
  ];
}
