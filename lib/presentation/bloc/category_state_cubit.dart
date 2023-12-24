import 'package:fake_tech_store/domain/repository.dart';
import 'package:fake_tech_store/presentation/bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryStateCubit extends Cubit<CategoryState> {
  final ElectronicsRepository _electricsRepository;

  CategoryStateCubit(this._electricsRepository)
      : super(
          const CategoryState(
            items: [],
            isError: false,
            isLoading: false,
          ),
        );

  Future<void> loadCategorys() async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await _electricsRepository.getAllElectronics();
      emit(state.copyWith(items: items, isLoading: false));
    } on Exception catch (ex, stacktrace) {
      print('Failed to load: ex $ex, stacktrace: $stacktrace');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
