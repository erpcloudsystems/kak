part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentLocationEvent extends AddressEvent {}

class GetAddressEvent extends AddressEvent {
  final LatLng coordinates;
  const GetAddressEvent({required this.coordinates});

  @override
  List<Object> get props => [coordinates];
}