part of 'location_bloc.dart';

class LocationState extends Equatable {
  // Current location
  final RequestState getCurrentLocationState;
  final String getCurrentLocationMessage;
  final LatLng currentLocationCoordinates;

  // Address
  final RequestState getAddressState;
  final String getAddressMessage;
  final GoogleAddressEntity googleAddress;

  const LocationState({
    // Current location
    this.getCurrentLocationState = RequestState.stable,
    this.getCurrentLocationMessage = 'get current location initial message',
    this.currentLocationCoordinates = const LatLng(0, 0),

    // Address
    this.getAddressState = RequestState.stable,
    this.getAddressMessage = 'get address initial message',
    this.googleAddress = const GoogleAddressEntity(
      fullAddress: 'fullAddress',
      longitude: 'longitude',
      latitude: 'latitude',
      country: 'country',
      city: 'city',
    ),
  });

  LocationState copyWith({
    // Current location
    RequestState? getCurrentLocationState,
    String? getCurrentLocationMessage,
    LatLng? currentLocationCoordinates,

    // Address
    RequestState? getAddressState,
    String? getAddressMessage,
    GoogleAddressEntity? googleAddress,
  }) =>
      LocationState(
        // Current location
        getCurrentLocationState:
            getCurrentLocationState ?? this.getCurrentLocationState,
        getCurrentLocationMessage:
            getCurrentLocationMessage ?? this.getCurrentLocationMessage,
        currentLocationCoordinates:
            currentLocationCoordinates ?? this.currentLocationCoordinates,

        // Address
        getAddressState: getAddressState ?? this.getAddressState,
        getAddressMessage: getAddressMessage ?? this.getAddressMessage,
        googleAddress: googleAddress ?? this.googleAddress,
      );

  @override
  List<Object> get props => [
        // Current location
        getCurrentLocationState,
        getCurrentLocationMessage,
        currentLocationCoordinates,

        // Address
        getAddressState,
        getAddressMessage,
        googleAddress,
      ];
}
