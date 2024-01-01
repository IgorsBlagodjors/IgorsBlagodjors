import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/domain/repository.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCategoryStateCubit extends Cubit<CategoryState> {
  final ElectronicsRepository _electronicsRepository;

  FavCategoryStateCubit(this._electronicsRepository)
      : super(
          const CategoryState(
            items: [],
            isError: false,
            isLoading: false,
          ),
        );

  Future<void> loadFaveItems() async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _electronicsRepository.getCheckAndFaveItems(true);
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }

  Future<void> removeFaveItems(Electronics item) async {
    try {
      _electronicsRepository.removeCheckAndFaveItem(item, true);
    } on Exception catch (ex, stacktrace) {
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
    }
  }

  Future<void> undo(Electronics item) async {
    try {
      _electronicsRepository.undo(item, true);
    } on Exception catch (ex, stacktrace) {
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
    }
  }
}
