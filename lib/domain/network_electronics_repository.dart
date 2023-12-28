import 'package:fake_tech_store/date/electronics_api_client.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/domain/repository.dart';

class NetworkElectronicsRepository implements ElectronicsRepository {
  final ElectronicsApiClient _electronicsApiClient;
  NetworkElectronicsRepository(
    this._electronicsApiClient,
  );
  List<Electronics> checkoutList = [];

  @override
  Future<List<Electronics>> getAllElectronics(
      String category, int offset) async {
    final response = await _electronicsApiClient.getAllElectronics(
        category: category, offset: offset);
    return response;
  }

  @override
  Future<void> addToCard(Electronics item) async {
    checkoutList.add(item);
    print(checkoutList);
  }

  @override
  Future<List<Electronics>> getCheckoutItems() async {
    return checkoutList;
  }
}
