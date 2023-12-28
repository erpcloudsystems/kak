import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enums.dart';
import '../bloc/address/address_bloc.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_floating_button.dart';
import '../widgets/all_addresses/delivery_addresses_success_component.dart';

class AllAddressesScreen extends StatelessWidget {
  const AllAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(StringsManager.deliveryAddresses)),
      body: BlocConsumer<AddressBloc, AddressState>(
        listenWhen: (previous, current) =>
            previous.getAllAddressesState != current.getAllAddressesState,
        listener: handleGetAddressStates,
        buildWhen: (previous, current) =>
            previous.getAllAddressesData != current.getAllAddressesData,
        builder: (context, state) => DeliveryAddressesSuccessComponent(
          addresses: state.getAllAddressesData,
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        title: StringsManager.addAddress,
        onPressed: () => Navigator.of(context).pushNamed(Routes.mapScreenKey),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  /// This switch handle get all addresses state changes.
  void handleGetAddressStates(context, state) {
    switch (state.getAllAddressesState) {
      // We don't display an loading indicator here because it's handled in the check button.
      case RequestState.success:
        Navigator.of(context).pop();
        break;
      case RequestState.error:
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) => ErrorDialog(
            errorMessage: state.getAllAddressesMessage,
          ),
        );
        break;
      default:
    }
  }
}
