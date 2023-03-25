import 'package:get/get.dart';
import 'package:orlandev_flutter_portafolio/app/data/network/portfolio_api.dart';
import 'package:orlandev_flutter_portafolio/app/data/repository/repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PortfolioApi>(
      () => PortfolioApi(),
    );
    Get.lazyPut<PortfolioRepository>(
      () => PortfolioRepository(),
    );
  }
}
