import 'package:collection/collection.dart';

import '../../domain/entities/google_address.dart';

class GoogleAddressModel extends GoogleAddressEntity {
  const GoogleAddressModel({
    required super.fullAddress,
    required super.longitude,
    required super.latitude,
    required super.country,
    required super.city,
  });

  factory GoogleAddressModel.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List<dynamic>;
    final firstResult = results.isNotEmpty ? results[0] : null;

    final geometry = firstResult['geometry'] as Map<String, dynamic>;
    final location = geometry['location'] as Map<String, dynamic>;

    final addressComponents =
        firstResult?['address_components'] as List<dynamic>;

    final countryComponent = addressComponents.firstWhereOrNull(
      (component) => (component['types'] as List<dynamic>).contains('country'),
    );

    final cityComponent = addressComponents.firstWhereOrNull(
      (component) => (component['types'] as List<dynamic>)
          .contains('administrative_area_level_1'),
    );

    return GoogleAddressModel(
      fullAddress: firstResult?['formatted_address'] ?? '',
      longitude: location['lng'].toString(),
      latitude: location['lat'].toString(),
      country: countryComponent?['long_name'] ?? '',
      city: cityComponent?['long_name'] ?? '',
    );
  }
}
