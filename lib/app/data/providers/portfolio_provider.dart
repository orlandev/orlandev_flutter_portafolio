import 'package:get/get.dart';

import '../portfolio_model.dart';

class PortfolioProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Portfolio.fromJson(map);
      if (map is List) {
        return map.map((item) => Portfolio.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Portfolio?> getPortfolio(int id) async {
    final response = await get('portfolio/$id');
    return response.body;
  }

  Future<Response<Portfolio>> postPortfolio(Portfolio portfolio) async =>
      await post('portfolio', portfolio);
  Future<Response> deletePortfolio(int id) async =>
      await delete('portfolio/$id');
}
