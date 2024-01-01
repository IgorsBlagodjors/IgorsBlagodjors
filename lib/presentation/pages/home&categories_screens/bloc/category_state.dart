import 'package:equatable/equatable.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';

class CategoryState extends Equatable {
  final List<Electronics> items;
  final bool isLoading;
  final bool isError;

  const CategoryState({
    required this.items,
    required this.isError,
    required this.isLoading,
  });

  CategoryState copyWith({
    List<Electronics>? items,
    bool? isLoading,
    bool? isError,
  }) =>
      CategoryState(
        items: items ?? this.items,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
      );

  @override
  List<Object?> get props => [items, isLoading, isError];
}
