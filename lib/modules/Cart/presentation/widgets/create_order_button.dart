import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'checkout_card.dart';
import '../bloc/cart_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../../Address/presentation/bloc/address/address_bloc.dart';
import '../../../authentication/presentation/bloc/regular_sign/authentication_bloc.dart';

class CreateOrderSection extends StatelessWidget {
  const CreateOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flexible(flex: IntManager.i_1, child: CreateOrderButton());
  }
}

class CreateOrderButton extends StatelessWidget {
  const CreateOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listenWhen: (previous, current) =>
          previous.getAllAddressesState != current.getAllAddressesState,
      listener: checkForUserAddress,
      child: TotalCard(
        checkoutFunction: () {
          context.read<AuthenticationBloc>().state.isUserLoggedIn
              ? context.read<AddressBloc>().add(GetAllAddressesEvent())
              : letTheUserLogin(context);
        },
        total: context.watch<CartBloc>().state.totalPrice.toString(),
      ),
    );
  }

  /// Send an event to get the addresses of the user, if there isn't, it navigate to the map.
  void checkForUserAddress(BuildContext context, AddressState state) {
    if (state.getAllAddressesState == RequestState.loading) {
      LoadingUtils.showLoadingDialog(context, LoadingType.circular);
    }
    if (state.getAllAddressesState == RequestState.success) {
      Navigator.of(context).pop();
      state.getAllAddressesData.isEmpty
          ? Navigator.of(context).pushNamed(Routes.mapScreenKey)
          : Navigator.of(context).pushNamed(Routes.allAddressesScreenKey);
    }
    if (state.getAllAddressesState == RequestState.error) {
      Navigator.of(context).pop();
    }
  }

  /// Check if the user is logged in or not before making an order.
  void letTheUserLogin(BuildContext context) {
    ErrorDialogUtils.displayErrorDialog(
      context: context,
      errorMessage: StringsManager.loginFirstMessage(context),
      onPressed: () => Navigator.of(context).pushNamed(Routes.signInScreenKey),
    );
  }
}
