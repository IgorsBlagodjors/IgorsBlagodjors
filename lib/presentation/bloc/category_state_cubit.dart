import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/domain/repository.dart';
import 'package:fake_tech_store/presentation/bloc/category_state.dart';
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

  Future<void> loadCategorys(String category) async {
    emit(state.copyWith(isLoading: true));
    try {
      final items =
          await _electricsRepository.getAllElectronics(category, _offset);
      final allItems = _offset != 0 ? state.items + items : items;
      _offset += 50;
      emit(state.copyWith(items: allItems, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> addToCard(Electronics item) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _electricsRepository.addToCard(item);
    } on Exception catch (ex, stacktrace) {
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> getCheckoutItems() async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _electricsRepository.getCheckoutItems();
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  setOffset({required int offset}) {
    _offset = offset;
  }
}
