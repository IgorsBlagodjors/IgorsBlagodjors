import 'package:dio/dio.dart';
import 'package:fake_tech_store/date/response.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';

class ElectronicsApiClient {
  final Dio _dio;
  ElectronicsApiClient(this._dio);

  Future<List<Electronics>> getAllElectronics() async {
    final response = await _dio.get('products');
    final fullResponse = ElectronicsFullRespons.fromJson(response.data);
    return fullResponse.toModel();
  }
}
