import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:orlandev_flutter_portafolio/app/data/model/portfolio_dto_model.dart';

class PortfolioApi extends GetConnect implements GetxService {
  final _endpoint =
      'orlandev/orlandev_flutter_portafolio/master/assets/data/portfolio.json';

  @override
  void onInit() {
    defaultContentType = "application/json";

    baseUrl = 'https://raw.githubusercontent.com/';

    timeout = const Duration(seconds: 100);

    defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PortfolioDto.fromJson(map);
      if (map is List) {
        return map.map((item) => PortfolioDto.fromJson(item)).toList();
      }
    };

    Logger().d("onInit API");
  }

  Future<PortfolioDto?> getPortfolioDto(int id) async {
    Logger().d("API:  getPortfolioDto($id)   ");

    try {
      Logger().d("API:  Start TRY ");

      Response response = await get(_endpoint);

      Logger().d("API:  Result: ${response.body}");

      final jsonStr = await json.decode(response.body);

      var result = PortfolioDto.fromJson(jsonStr);

      return result;
    } on SocketException catch (e) {
      Logger().d("socketeeeeeeeeeeeeeeeeeeee");
      throw SocketException(e.message.toString());
    } on FormatException catch (_) {
      Logger().d("format");
      throw const FormatException("Unable to process the data");
    } catch (e) {
      Logger().d("Socket: ${e.toString()}");
      throw Exception("Error $e");
    }
  }

  Future<Response<PortfolioDto>> postPortfolioDto(
          PortfolioDto portfolioDto) async =>
      await post('PortfolioDto', portfolioDto);

  Future<Response> deletePortfolioDto(int id) async =>
      await delete('PortfolioDto/$id');
}
