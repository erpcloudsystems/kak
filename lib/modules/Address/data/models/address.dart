import '../../domain/entities/address.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.isDefaultAddress,
    super.additionalDirections,
    super.apartmentNumber,
    super.googleAddress,
    super.buildingName,
    super.addressTitle,
    super.country,
    super.street,
    super.floor,
    super.city,
    super.id,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        isDefaultAddress: json['is_primary_address'] == 1 ? true : false,
        apartmentNumber: json['custom_apartment'],
        buildingName: json['custom_building_name'],
        additionalDirections: json['address_line2'],
        googleAddress: json['address_line1'],
        addressTitle: json['address_title'],
        street: json['custom_street'],
        floor: json['custom_floor'],
        country: json['country'],
        city: json['city'],
        id: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'primary': isDefaultAddress ? 1 : 0,
        'address_line2': additionalDirections,
        'custom_building_name': buildingName,
        'custom_apartment': apartmentNumber,
        'address_line1': googleAddress,
        'address_title': addressTitle,
        'custom_street': street,
        'custom_floor': floor,
        'country': country,
        'city': city,
      };
}
