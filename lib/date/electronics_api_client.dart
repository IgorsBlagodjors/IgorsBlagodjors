import 'package:dio/dio.dart';
import 'package:fake_tech_store/date/response.dart';
import 'package:fake_tech_store/design_system/api_key.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';

class ElectronicsApiClient {
  final Dio _dio;
  ElectronicsApiClient(this._dio);

  Future<List<Electronics>> getAllElectronics(
      {String? category, int offset = 0}) async {
    final queryParam = {
      'q': category,
      'limit': 50,
      'offset': offset,
    };
    final response = await _dio.get('item_summary/search',
        queryParameters: queryParam, options: Options(headers: headers));
    final fullResponse = ElectronicsFullResponse.fromJson(response.data);
    return fullResponse.toModel();
  }
}
