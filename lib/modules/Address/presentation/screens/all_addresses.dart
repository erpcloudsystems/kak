import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enums.dart';
import '../bloc/address/address_bloc.dart';
import '../../../../core/utils/no_data.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/resources/assetss_path.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../widgets/all_addresses/delivery_addresses_success_component.dart';

class AllAddressesScreen extends StatefulWidget {
  const AllAddressesScreen({super.key});

  @override
  State<AllAddressesScreen> createState() => _AllAddressesScreenState();
}

class _AllAddressesScreenState extends State<AllAddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsManager.deliveryAddresses),
        titleTextStyle: Theme.of(context)
            .appBarTheme
            .titleTextStyle!
            .copyWith(fontSize: FontsSize.s18),
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        listenWhen: (previous, current) =>
            previous.getAllAddressesState != current.getAllAddressesState,
        listener: (context, state) {
          getAddressesSwitch(context, state);
        },
        buildWhen: (previous, current) =>
            previous.getAllAddressesState != current.getAllAddressesState ||
            previous.getAllAddressesData != current.getAllAddressesData,
        builder: addressesBuilderSwitch,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddressBloc>(context).add(GetAllAddressesEvent());
  }

  /// This switch handle get all addresses state changes.
  void getAddressesSwitch(BuildContext context, AddressState state) {
    switch (state.getAllAddressesState) {
      case RequestState.loading:
        LoadingUtils.showLoadingDialog(context, LoadingType.circular);
        break;
      case RequestState.success:
        Navigator.of(context).pop();
      case RequestState.error:
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) => ErrorDialog(
            errorMessage: state.getAllAddressesMessage,
          ),
        );
      default:
    }
  }

  /// This switch handle Get all address states.
  Widget addressesBuilderSwitch(context, state) {
    switch (state.getAllAddressesState) {
      case RequestState.loading:
        return const SizedBox();

      case RequestState.error:
        return const NoDataWidget(
          assetPath: ImagesPath.emptyCartPath,
          text: StringsManager.noAddressMessage,
        );
      default:
        final addresses = state.getAllAddressesData;
        return DeliveryAddressesSuccessComponent(addresses: addresses);
    }
  }
}
