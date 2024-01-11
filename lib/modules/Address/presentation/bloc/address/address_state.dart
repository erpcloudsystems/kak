part of 'address_bloc.dart';

class AddressState extends Equatable {
  // Send user Address
  final RequestState sendUserAddressState;
  final String sendUserAddressMessage, userAddressId;

  // Delete Address
  final RequestState deleteAddressState;
  final String deleteAddressMessage;

  // Set primary Address
  final RequestState setPrimaryAddressState;
  final String setPrimaryAddressMessage;

  // Get all addresses
  final RequestState getAllAddressesState;
  final String getAllAddressesMessage;
  final List<AddressEntity> getAllAddressesData;

  const AddressState({
    // Send user address
    this.sendUserAddressState = RequestState.stable,
    this.sendUserAddressMessage = 'Send user address initial message',
    this.userAddressId = 'user address id initial message',
    // delete address
    this.deleteAddressState = RequestState.stable,
    this.deleteAddressMessage = 'Delete address initial message',
    // Set primary address
    this.setPrimaryAddressState = RequestState.stable,
    this.setPrimaryAddressMessage = 'Set primary address initial message',
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
    // Delete address
    RequestState? deleteAddressState,
    String? deleteAddressMessage,
    // Set primary address
    RequestState? setPrimaryAddressState,
    String? setPrimaryAddressMessage,
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
        // Delete address
        deleteAddressState: deleteAddressState ?? this.deleteAddressState,
        deleteAddressMessage: deleteAddressMessage ?? this.deleteAddressMessage,
        // Set primary address
        setPrimaryAddressState: setPrimaryAddressState ?? this.setPrimaryAddressState,
        setPrimaryAddressMessage: setPrimaryAddressMessage ?? this.setPrimaryAddressMessage,
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
        // Delete address
        deleteAddressState,
        deleteAddressMessage,
        // Set primary address
        setPrimaryAddressState,
        setPrimaryAddressMessage,
        // Get all addresses
        getAllAddressesState,
        getAllAddressesMessage,
        getAllAddressesData,
      ];
}
