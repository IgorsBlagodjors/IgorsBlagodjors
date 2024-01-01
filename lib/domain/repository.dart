import 'package:fake_tech_store/domain/electronics_class.dart';

abstract class ElectronicsRepository {
  Future<List<Electronics>> getAllElectronics(String category, int offset);
  Future<List<Electronics>> getSliderItems(String category, int limit);
  Future<void> addCheckAndFaveItem(Electronics item, bool isFave);
  Future<List<Electronics>> getCheckAndFaveItems(bool isFave);
  Future<void> removeCheckAndFaveItem(Electronics item, bool isFave);
  Future<void> undo(Electronics item, bool isFave);
}
