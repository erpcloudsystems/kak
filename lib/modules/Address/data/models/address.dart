import '../../domain/entities/address.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.isDefaultAddress,
    required super.addressDetails,
    required super.addressTitle,
    required super.country,
    required super.city,
    required super.id,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        isDefaultAddress: json['is_primary_address'] == 1 ? true : false,
        addressDetails: json['address_line1'],
        addressTitle: json['address_title'],
        country: json['country'],
        city: json['city'],
        id: json['name'],
      );
}
