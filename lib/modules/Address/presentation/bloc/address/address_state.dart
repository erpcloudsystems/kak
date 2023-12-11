part of 'address_bloc.dart';

class AddressState extends Equatable {
  // Send user Address
  final RequestState sendUserAddressState;
  final String sendUserAddressMessage;

  const AddressState({
    // Send user address
    this.sendUserAddressState = RequestState.stable,
    this.sendUserAddressMessage = 'Send user address initial message',
  });

  AddressState copyWith({
    // Send user address
    RequestState? sendUserAddressState,
    String? sendUserAddressMessage,
  }) =>
      AddressState(
        // Send user address
        sendUserAddressState: sendUserAddressState ?? this.sendUserAddressState,
        sendUserAddressMessage:
            sendUserAddressMessage ?? this.sendUserAddressMessage,
      );

  @override
  List<Object> get props => [
        // Send user address
        sendUserAddressState,
        sendUserAddressMessage,
      ];
}
