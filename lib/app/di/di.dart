import 'package:get/get.dart';
import 'package:orlandev_flutter_portafolio/app/data/network/portfolio_api.dart';
import 'package:orlandev_flutter_portafolio/app/data/repository/repository.dart';

class DependencyInjection {
  static void init() async {
    Get.put(PortfolioApi());
    Get.put(PortfolioRepository());
  }
}
