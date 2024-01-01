import 'package:dio/dio.dart';
import 'package:fake_tech_store/date/response.dart';
import 'package:fake_tech_store/design_system/api.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';

class ElectronicsApiClient {
  final Dio _dio;
  ElectronicsApiClient(this._dio);

  Future<List<Electronics>> getAllElectronics(
      {String? category, int offset = 0, int limit = 50}) async {
    final queryParam = {
      'q': category,
      'limit': limit,
      'offset': offset,
    };

    final response = await _dio.get('item_summary/search',
        queryParameters: queryParam, options: Options(headers: headerAndKey));
    final fullResponse = ElectronicsFullResponse.fromJson(response.data);
    return fullResponse.toModel();
  }
}
