import 'package:equatable/equatable.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(createToJson: false)
class ElectronicsFullRespons extends Equatable {
  final List<ElectronicsResponse> products;

  const ElectronicsFullRespons({
    required this.products,
  });

  List<Electronics> toModel() {
    return products
        .map((e) => Electronics(
              id: e.id ?? 0,
              title: e.title ?? 'Unknown',
              brand: e.brand ?? 'Unknown',
              category: e.category ?? 'Unknown',
              description: e.description ?? 'Unknown',
              images: e.images ?? ['Unknown'],
              price: e.price ?? 0,
            ))
        .toList();
  }

  @override
  List<Object?> get props => [
        products,
      ];

  factory ElectronicsFullRespons.fromJson(Map<String, dynamic> json) =>
      _$ElectronicsFullResponsFromJson(json);
}

@JsonSerializable(createToJson: false)
class ElectronicsResponse {
  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final String? brand;
  final String? category;
  final List<String>? images;

  ElectronicsResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.category,
    required this.images,
  });
  factory ElectronicsResponse.fromJson(Map<String, dynamic> json) =>
      _$ElectronicsResponseFromJson(json);
}
