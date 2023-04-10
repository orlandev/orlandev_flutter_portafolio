import 'package:get/get.dart';

import 'app/data/providers/portfolio_provider.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PortfolioProvider(), permanent: true);
  }
}
