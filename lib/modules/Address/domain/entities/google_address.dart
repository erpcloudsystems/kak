import 'package:equatable/equatable.dart';

class GoogleAddressEntity extends Equatable {
  final String fullAddress, city, country, latitude, longitude;

  const GoogleAddressEntity({
    required this.fullAddress,
    required this.longitude,
    required this.latitude,
    required this.country,
    required this.city,
  });

  @override
  List<Object?> get props => [
        fullAddress,
        longitude,
        latitude,
        country,
        city,
      ];
}
