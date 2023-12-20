import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String? id,
      additionalDirections,
      apartmentNumber,
      googleAddress,
      addressTitle,
      buildingName,
      country,
      street,
      floor,
      city;
  final bool isDefaultAddress;

  const AddressEntity({
    required this.isDefaultAddress,
    this.additionalDirections,
    this.apartmentNumber,
    this.googleAddress,
    this.buildingName,
    this.addressTitle,
    this.country,
    this.street,
    this.floor,
    this.city,
    this.id,
  });

  @override
  List<Object?> get props => [
        additionalDirections,
        isDefaultAddress,
        apartmentNumber,
        googleAddress,
        addressTitle,
        buildingName,
        country,
        street,
        floor,
        city,
        id,
      ];
}
