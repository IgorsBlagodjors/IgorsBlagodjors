import 'package:equatable/equatable.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(createToJson: false)
class ElectronicsFullResponse extends Equatable {
  final List<ElectronicsResponse> itemSummaries;

  const ElectronicsFullResponse({
    required this.itemSummaries,
  });
  factory ElectronicsFullResponse.fromJson(Map<String, dynamic> json) =>
      _$ElectronicsFullResponseFromJson(json);

  List<Electronics> toModel() {
    return itemSummaries
        .map(
          (e) => Electronics(
            id: e.itemId ?? 'Unknown',
            title: e.title ?? 'Unknown',
            imageUrl: e.image.imageUrl ?? 'Unknown',
            currency: e.price.currency ?? 'EUR',
            priceValue: e.price.value ?? '0',
          ),
        )
        .toList();
  }

  @override
  List<Object?> get props => [
        itemSummaries,
      ];
}

@JsonSerializable(createToJson: false)
class ElectronicsResponse {
  final String? itemId;
  final String? title;
  final Image image;
  final Price price;
  const ElectronicsResponse({
    required this.itemId,
    required this.title,
    required this.image,
    required this.price,
  });
  factory ElectronicsResponse.fromJson(Map<String, dynamic> json) =>
      _$ElectronicsResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Price {
  final String? value;
  final String? currency;
  const Price({
    required this.value,
    required this.currency,
  });
  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}

@JsonSerializable(createToJson: false)
class Image {
  final String? imageUrl;
  const Image({
    required this.imageUrl,
  });
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
