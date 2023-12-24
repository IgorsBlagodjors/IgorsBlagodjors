// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectronicsFullRespons _$ElectronicsFullResponsFromJson(
        Map<String, dynamic> json) =>
    ElectronicsFullRespons(
      products: (json['products'] as List<dynamic>)
          .map((e) => ElectronicsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ElectronicsResponse _$ElectronicsResponseFromJson(Map<String, dynamic> json) =>
    ElectronicsResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
