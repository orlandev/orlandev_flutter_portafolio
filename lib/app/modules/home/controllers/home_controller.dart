import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:orlandev_flutter_portafolio/app/data/model/portfolio_dto_model.dart';
import 'package:orlandev_flutter_portafolio/app/data/repository/repository.dart';

class HomeController extends GetxController {
  final PortfolioRepository _repository = Get.find<PortfolioRepository>();

  Rx<PortfolioDto> currentPortfolio = PortfolioDto(null, null).obs;

  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _repository.getPortfolio().then((value) {
      Logger().d("HomeController: $value");
      if (value != null) {
        currentPortfolio.value = value;
      } else {
        Logger().d("HomeController: $value");
      }
    });
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    super.onClose();
  }
}
