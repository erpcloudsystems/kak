import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kak/core/resources/strings_manager.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/error_dialog.dart';
import '../../../../../core/utils/snack_bar_util.dart';
import '../../../../Address/domain/entities/address.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/utils/loading_indicator_util.dart';
import '../../../../Address/presentation/bloc/address/address_bloc.dart';

class DefaultAddressForm extends StatefulWidget {
  const DefaultAddressForm({super.key});

  @override
  State<DefaultAddressForm> createState() => _DefaultAddressFormState();
}

class _DefaultAddressFormState extends State<DefaultAddressForm> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AddressBloc>().add(GetAllAddressesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressBloc, AddressState>(
      listenWhen: (previous, current) =>
          previous.setPrimaryAddressState != current.setPrimaryAddressState,
      listener: setPrimaryAddressStateHandler,
      buildWhen: (previous, current) =>
          previous.getAllAddressesState != current.getAllAddressesState,
      builder: getAllAddressBuilderHandler,
    );
  }

  Widget getAllAddressBuilderHandler(BuildContext context, AddressState state) {
    switch (state.getAllAddressesState) {
      case RequestState.loading:
        return const Center(child: CircularProgressIndicator());

      case RequestState.error:
        ErrorDialogUtils.displayErrorDialog(
            context: context, errorMessage: state.getAllAddressesMessage);
        break;

      case RequestState.success:
        final List<AddressEntity> addressesList = state.getAllAddressesData;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              StringsManager.primaryAddress(context),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: ColorsManager.mainColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: DoubleManager.d_10),
              child: DropdownButtonFormField<AddressEntity>(
                value: addressesList
                    .firstWhere((element) => element.isDefaultAddress == true),
                items: addressesList
                    .map((value) => DropdownMenuItem<AddressEntity>(
                          value: value,
                          child: Text(
                            value.addressTitle!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  context
                      .read<AddressBloc>()
                      .add(SetPrimaryAddressEvent(addressId: value!.id!));
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsetsDirectional.only(start: DoubleManager.d_45),
                ),
              ),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
    return const SizedBox();
  }

  void setPrimaryAddressStateHandler(BuildContext context, AddressState state) {
    switch (state.setPrimaryAddressState) {
      case RequestState.loading:
        LoadingUtils.showLoadingDialog(
            context, LoadingType.linear, StringsManager.changingAddress(context));
        break;
      case RequestState.success:
        SnackBarUtil().getSnackBar(
          context: context,
          message: StringsManager.primaryAddressChanged(context),
          color: ColorsManager.gGreen,
        );
        Navigator.of(context).pop();
        break;
      case RequestState.error:
        Navigator.of(context).pop();
        ErrorDialogUtils.displayErrorDialog(
            context: context, errorMessage: state.setPrimaryAddressMessage);
        break;
      default:
    }
  }
}
