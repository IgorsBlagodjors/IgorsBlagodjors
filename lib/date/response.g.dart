// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectronicsFullResponse _$ElectronicsFullResponseFromJson(
        Map<String, dynamic> json) =>
    ElectronicsFullResponse(
      itemSummaries: (json['itemSummaries'] as List<dynamic>)
          .map((e) => ElectronicsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ElectronicsResponse _$ElectronicsResponseFromJson(Map<String, dynamic> json) =>
    ElectronicsResponse(
      itemId: json['itemId'] as String?,
      title: json['title'] as String?,
      image: Image.fromJson(json['image'] as Map<String, dynamic>),
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      value: json['value'] as String?,
      currency: json['currency'] as String?,
    );

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      imageUrl: json['imageUrl'] as String?,
    );
