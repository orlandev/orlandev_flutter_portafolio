import 'package:get/get.dart';
import 'package:orlandev_flutter_portafolio/app/data/model/portfolio_dto_model.dart';

class PortfolioApi extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PortfolioDto.fromJson(map);
      if (map is List) {
        return map.map((item) => PortfolioDto.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'https://raw.githubusercontent.com/';
  }

  Future<PortfolioDto?> getPortfolioDto(int id) async {
    final response = await get(
        'orlandev/orlandev_flutter_portafolio/master/assets/data/PortfolioDto.json');
    return response.body;
  }

  Future<Response<PortfolioDto>> postPortfolioDto(
          PortfolioDto PortfolioDto) async =>
      await post('PortfolioDto', PortfolioDto);

  Future<Response> deletePortfolioDto(int id) async =>
      await delete('PortfolioDto/$id');
}
