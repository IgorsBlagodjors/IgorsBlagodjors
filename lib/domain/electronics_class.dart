import 'package:equatable/equatable.dart';

class Electronics extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String currency;
  final String priceValue;

  const Electronics({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.currency,
    required this.priceValue,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        currency,
        priceValue,
      ];
}
