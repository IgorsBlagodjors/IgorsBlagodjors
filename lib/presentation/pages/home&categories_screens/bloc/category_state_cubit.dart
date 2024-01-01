import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/domain/repository.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryStateCubit extends Cubit<CategoryState> {
  final ElectronicsRepository _electricsRepository;
  int _offset = 0;

  CategoryStateCubit(this._electricsRepository)
      : super(
          const CategoryState(
            items: [],
            isError: false,
            isLoading: false,
          ),
        );

  Future<void> loadCategories(String category, bool descendingOrder) async {
    emit(state.copyWith(isLoading: true));
    try {
      final items =
          await _electricsRepository.getAllElectronics(category, _offset);
      final allItems = _offset != 0
          ? descendingOrder
              ? _descending(state.items + items)
              : _ascendingFilter(state.items + items)
          : descendingOrder
              ? _descending(items)
              : _ascendingFilter(items);
      _offset += 50;
      emit(state.copyWith(items: allItems, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> loadCarouselItems(List<String> categories) async {
    emit(state.copyWith(isLoading: true));
    try {
      List<Electronics> allItems = [];
      for (String category in categories) {
        final items = await _electricsRepository.getSliderItems(category, 1);
        allItems.add(items[0]);
      }
      emit(state.copyWith(items: allItems, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  List<Electronics> _ascendingFilter(List<Electronics> data) {
    data.sort((a, b) =>
        double.parse(a.priceValue).compareTo(double.parse(b.priceValue)));
    return data;
  }

  List<Electronics> _descending(List<Electronics> data) {
    data.sort((b, a) =>
        double.parse(a.priceValue).compareTo(double.parse(b.priceValue)));
    return data;
  }

  setOffset({required int offset}) {
    _offset = offset;
  }
}
