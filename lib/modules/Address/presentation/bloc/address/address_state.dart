part of 'address_bloc.dart';

class AddressState extends Equatable {
  // Send user Address
  final RequestState sendUserAddressState;
  final String sendUserAddressMessage, userAddressId;

  // User chosen address
  final AddressCreatorEntity userChosenAddress;

  // Get all addresses
  final RequestState getAllAddressesState;
  final String getAllAddressesMessage;
  final List<AddressEntity> getAllAddressesData;

  const AddressState({
    // Send user address
    this.sendUserAddressState = RequestState.stable,
    this.sendUserAddressMessage = 'Send user address initial message',
    this.userAddressId = 'user address id initial message',
    // User chosen address
    this.userChosenAddress = const AddressCreatorEntity(
        googleAddress: '',
        apartmentNumber: '',
        buildingName: '',
        isPrimary: false,
        street: ''),
    // Get all addresses
    this.getAllAddressesState = RequestState.stable,
    this.getAllAddressesMessage = 'Get All Addresses initial message',
    this.getAllAddressesData = const [],
  });

  AddressState copyWith({
    // Send user address
    RequestState? sendUserAddressState,
    String? sendUserAddressMessage,
    userAddressId,
    // User chosen address
    AddressCreatorEntity? userChosenAddress,
    // Get all addresses
    RequestState? getAllAddressesState,
    String? getAllAddressesMessage,
    List<AddressEntity>? getAllAddressesData,
  }) =>
      AddressState(
        // Send user address
        sendUserAddressState: sendUserAddressState ?? this.sendUserAddressState,
        sendUserAddressMessage:
            sendUserAddressMessage ?? this.sendUserAddressMessage,
        userAddressId: userAddressId ?? this.userAddressId,
        // User chosen address
        userChosenAddress: userChosenAddress ?? this.userChosenAddress,
        // Get all addresses
        getAllAddressesState: getAllAddressesState ?? this.getAllAddressesState,
        getAllAddressesMessage:
            getAllAddressesMessage ?? this.getAllAddressesMessage,
        getAllAddressesData: getAllAddressesData ?? this.getAllAddressesData,
      );

  @override
  List<Object> get props => [
        // Send user address
        sendUserAddressState,
        sendUserAddressMessage,
        userAddressId,
        // User chosen address
        userChosenAddress,
        // Get all addresses
        getAllAddressesState,
        getAllAddressesMessage,
        getAllAddressesData,
      ];
}
