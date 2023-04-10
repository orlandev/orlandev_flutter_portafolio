import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:orlandev_flutter_portafolio/app/data/model/portfolio_dto_model.dart';

class PortfolioProvider extends GetConnect implements GetxService {
  final _endpoint =
      'orlandev/orlandev_flutter_portafolio/master/assets/data/portfolio.json';

  final Logger _log = Logger();

  @override
  void onInit() {
    _log.d("onInit API");

    defaultContentType = "application/json";
    baseUrl = 'https://raw.githubusercontent.com/';
    timeout = const Duration(seconds: 30);
    defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PortfolioDto.fromJson(map);
      if (map is List) {
        return map.map((item) => PortfolioDto.fromJson(item)).toList();
      }
    };
  }

  Future<PortfolioDto?> getPortfolioDto() async {
    _log.d("API:  Start TRY ");
    Response response = await get(_endpoint);

    if (response.isOk) {
      _log.d("API:  Result: ${response.body}");
      final jsonStr = await json.decode(response.body);
      return PortfolioDto.fromJson(jsonStr);
    }

    _log.d("API:  Result: ${response.status}");
    _log.d("API:  Result: ${response.body}");

    return null;
  }
}
