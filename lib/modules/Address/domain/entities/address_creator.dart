import 'package:equatable/equatable.dart';

class AddressCreatorEntity extends Equatable {
  final String googleAddress, buildingName, apartmentNumber, street;
  final String? floor, additionalDirections;
  final bool isPrimary;
  const AddressCreatorEntity({
    required this.googleAddress,
    required this.apartmentNumber,
    required this.buildingName,
    required this.isPrimary,
    required this.street,
    this.additionalDirections,
    this.floor,
  });

  @override
  List<Object?> get props => [
        additionalDirections,
        apartmentNumber,
        googleAddress,
        buildingName,
        isPrimary,
        street,
        floor,
      ];
}
