import 'package:equatable/equatable.dart';

class Electronics extends Equatable {
  final int id;
  final String title;
  final String description;
  final int price;
  final String brand;
  final String category;
  final List<String> images;

  const Electronics({
    required this.id,
    required this.title,
    required this.brand,
    required this.category,
    required this.description,
    required this.images,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        brand,
        category,
        description,
        images,
        price,
      ];
}
