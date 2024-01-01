import 'package:fake_tech_store/date/electronics_api_client.dart';
import 'package:fake_tech_store/design_system/constants.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/domain/repository.dart';

class NetworkElectronicsRepository implements ElectronicsRepository {
  final ElectronicsApiClient _electronicsApiClient;
  NetworkElectronicsRepository(
    this._electronicsApiClient,
  );
  List<Electronics> checkoutList = [];
  late int index;

  @override
  Future<List<Electronics>> getAllElectronics(
      String category, int offset) async {
    final response = await _electronicsApiClient.getAllElectronics(
        category: category, offset: offset);
    return response;
  }

  @override
  Future<void> addCheckAndFaveItem(Electronics item, isFave) async {
    isFave ? faveList.add(item) : checkoutList.add(item);
    print('\x1B[31m$faveList');
  }

  @override
  Future<List<Electronics>> getCheckAndFaveItems(isFave) async {
    return isFave ? faveList : checkoutList;
  }

  @override
  Future<void> removeCheckAndFaveItem(Electronics item, bool isFave) async {
    index = isFave ? faveList.indexOf(item) : checkoutList.indexOf(item);
    isFave ? faveList.remove(item) : checkoutList.remove(item);
  }

  @override
  Future<void> undo(Electronics item, bool isFave) async {
    isFave ? faveList.insert(index, item) : checkoutList.insert(index, item);
  }

  @override
  Future<List<Electronics>> getSliderItems(String category, int limit) async {
    final response = await _electronicsApiClient.getAllElectronics(
        category: category, limit: limit);
    return response;
  }
}
