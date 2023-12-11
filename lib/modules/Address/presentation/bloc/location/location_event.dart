part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentLocationEvent extends LocationEvent {}

class GetAddressEvent extends LocationEvent {
  final LatLng coordinates;
  const GetAddressEvent({required this.coordinates});

  @override
  List<Object> get props => [coordinates];
}
