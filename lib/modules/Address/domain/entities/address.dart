import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String googleAddress, buildingName, apartmentNumber, street;
  final String? floor, additionalDirections;
  final bool isPrimary;
  const AddressEntity({
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
