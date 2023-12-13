part of 'address_bloc.dart';

class AddressState extends Equatable {
  // Send user Address
  final RequestState sendUserAddressState;
  final String sendUserAddressMessage;

  // User chosen address
  final AddressEntity userChosenAddress;

  const AddressState({
    // Send user address
    this.sendUserAddressState = RequestState.stable,
    this.sendUserAddressMessage = 'Send user address initial message',
    // User chosen address
    this.userChosenAddress = const AddressEntity(
        googleAddress: '',
        apartmentNumber: '',
        buildingName: '',
        isPrimary: false,
        street: ''),
  });

  AddressState copyWith({
    // Send user address
    RequestState? sendUserAddressState,
    String? sendUserAddressMessage,
    // User chosen address
    AddressEntity? userChosenAddress,
  }) =>
      AddressState(
        // Send user address
        sendUserAddressState: sendUserAddressState ?? this.sendUserAddressState,
        sendUserAddressMessage:
            sendUserAddressMessage ?? this.sendUserAddressMessage,
        // User chosen address
        userChosenAddress: userChosenAddress ?? this.userChosenAddress,
      );

  @override
  List<Object> get props => [
        // Send user address
        sendUserAddressState,
        sendUserAddressMessage,
        // User chosen address
        userChosenAddress,
      ];
}
