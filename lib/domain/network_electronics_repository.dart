import 'package:fake_tech_store/date/electronics_api_client.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/domain/repository.dart';

class NetworkElectronicsRepository implements ElectronicsRepository {
  final ElectronicsApiClient _electronicsApiClient;
  NetworkElectronicsRepository(
    this._electronicsApiClient,
  );

  @override
  Future<List<Electronics>> getAllElectronics() async {
    final response = await _electronicsApiClient.getAllElectronics();
    return response;
  }
}
