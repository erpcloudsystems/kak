import '../../domain/entities/address.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.googleAddress,
    required super.apartmentNumber,
    required super.buildingName,
    required super.isPrimary,
    required super.street,
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

    addressString += 'Area: $googleAddress';

    return {
      'primary': isPrimary ? 1 : 0,
      'address_line1': addressString,
    };
  }
}
