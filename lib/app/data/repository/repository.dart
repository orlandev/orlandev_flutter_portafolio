import 'package:get/get.dart';
import 'package:orlandev_flutter_portafolio/app/data/model/portfolio_dto_model.dart';
import 'package:orlandev_flutter_portafolio/app/data/network/portfolio_api.dart';

class PortfolioRepository {
  final PortfolioApi api = Get.find<PortfolioApi>();

  PortfolioRepository();

  Future<PortfolioDto?> getPortfolio() => api.getPortfolioDto(0);

}
