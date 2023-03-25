import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:orlandev_flutter_portafolio/app/data/model/portfolio_dto_model.dart';

class PortfolioApi extends GetConnect {
  final _endpoint =
      'orlandev/orlandev_flutter_portafolio/master/assets/data/portfolio.json';

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PortfolioDto.fromJson(map);
      if (map is List) {
        return map.map((item) => PortfolioDto.fromJson(item)).toList();
      }
    };

    httpClient.baseUrl = 'https://raw.githubusercontent.com/';

    Logger().d("onInit API");

  }

  Future<PortfolioDto?> getPortfolioDto(int id) async {

    Logger().d("API:  getPortfolioDto($id)   ");

    final response = await get(_endpoint, contentType: "application/json");

    Logger().d("API: FETCH: ${httpClient.baseUrl}$_endpoint");

    Logger().d("API: FETCH: ${response.body}");

    return response.body;
  }

  Future<Response<PortfolioDto>> postPortfolioDto(
          PortfolioDto PortfolioDto) async =>
      await post('PortfolioDto', PortfolioDto);

  Future<Response> deletePortfolioDto(int id) async =>
      await delete('PortfolioDto/$id');
}
