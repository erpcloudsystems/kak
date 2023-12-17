import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String id, addressTitle, addressDetails, city, country;
  final bool isDefaultAddress;

  const AddressEntity({
    required this.isDefaultAddress,
    required this.addressDetails,
    required this.addressTitle,
    required this.country,
    required this.city,
    required this.id,
  });

  @override
  List<Object?> get props => [
        isDefaultAddress,
        addressDetails,
        addressTitle,
        country,
        city,
        id,
      ];
}
