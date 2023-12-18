import '../../domain/entities/address_creator.dart';

class AddressCreatorModel extends AddressCreatorEntity {
  const AddressCreatorModel({
    required super.googleAddress,
    required super.apartmentNumber,
    required super.buildingName,
    required super.isPrimary,
    required super.street,
    required super.title,
    super.additionalDirections,
    super.floor,
  });

  Map<String, dynamic> toJson() {
    String addressString =
        ' Apt.No: $apartmentNumber, Building Name: $buildingName, Street: $street';
    if (floor != null) {
      addressString += ', Floor: $floor';
    }

    if (additionalDirections != null) {
      addressString += ', Additional Directions: $additionalDirections';
    }

    addressString += ', Area: $googleAddress';

    return {
      'primary': isPrimary ? 1 : 0,
      'address_line1': addressString,
      'address_title': title,
    };
  }
}