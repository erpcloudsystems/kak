part of 'address_bloc.dart';

sealed class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class SendUserAddressEvent extends AddressEvent {
  final AddressCreatorEntity address;

  const SendUserAddressEvent({required this.address});

  @override
  List<Object> get props => [address];
}

class GetAllAddressesEvent extends AddressEvent {}
