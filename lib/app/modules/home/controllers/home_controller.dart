import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:orlandev_flutter_portafolio/app/data/model/portfolio_dto_model.dart';
import 'package:orlandev_flutter_portafolio/app/data/providers/portfolio_provider.dart';

class HomeController extends GetxController {
  final PortfolioProvider portfolioProvider;

  final Logger _log = Logger();

  HomeController({required this.portfolioProvider});

  Rx<PortfolioDto> currentPortfolio = PortfolioDto().obs;

  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    RxStatus.loading();
    portfolioProvider.getPortfolioDto().then((value) {
      _log.d("HomeController: $value");
      if (value != null) {
        currentPortfolio.value = value;
      } else {
        _log.d("HomeController: $value");
      }
    });
  }
}
