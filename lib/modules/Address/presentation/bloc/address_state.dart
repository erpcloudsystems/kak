part of 'address_bloc.dart';

class AddressState extends Equatable {
  final RequestState getCurrentLocationState;
  final String getCurrentLocationMessage;
  final LatLng currentLocationCoordinates;

  const AddressState(
      {this.getCurrentLocationState = RequestState.stable,
      this.getCurrentLocationMessage = 'get current location initial message',
      this.currentLocationCoordinates = const LatLng(0, 0)});

  AddressState copyWith({
    RequestState? getCurrentLocationState,
    String? getCurrentLocationMessage,
    LatLng? currentLocationCoordinates,
  }) =>
      AddressState(
        getCurrentLocationState:
            getCurrentLocationState ?? this.getCurrentLocationState,
        getCurrentLocationMessage:
            getCurrentLocationMessage ?? this.getCurrentLocationMessage,
        currentLocationCoordinates:
            currentLocationCoordinates ?? this.currentLocationCoordinates,
      );

  @override
  List<Object> get props => [
        getCurrentLocationState,
        getCurrentLocationMessage,
        currentLocationCoordinates,
      ];
}
