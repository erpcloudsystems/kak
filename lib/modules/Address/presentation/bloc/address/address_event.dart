part of 'address_bloc.dart';

sealed class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class SendUserAddressEvent extends AddressEvent {
  final AddressEntity address;

  const SendUserAddressEvent({required this.address});

  @override
  List<Object> get props => [address];
}

class DeleteAddressEvent extends AddressEvent {
  final String addressId;
  const DeleteAddressEvent({required this.addressId});

  @override
  List<Object> get props => [addressId];
}

class GetAllAddressesEvent extends AddressEvent {}
