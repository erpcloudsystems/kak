import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'delivery_address_component.dart';
import '../../../../../core/utils/enums.dart';
import '../../bloc/address/address_bloc.dart';
import '../../../domain/entities/address.dart';
import '../../../../../core/utils/error_dialog.dart';
import '../../../../../core/utils/snack_bar_util.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/loading_indicator_util.dart';

class DeliveryAddressesSuccessComponent extends StatelessWidget {
  const DeliveryAddressesSuccessComponent({
    super.key,
    required this.addresses,
  });

  final List<AddressEntity> addresses;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listenWhen: (previous, current) =>
          previous.deleteAddressState != current.deleteAddressState,
      listener: deleteAddressSwitch,
      child: AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: DoubleManager.d_100),
          itemCount: addresses.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: DoubleManager.d_90.h,
                curve: Curves.decelerate,
                child: FadeInAnimation(
                  child: DeliveryAddressComponent(
                    address: addresses[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// This switch handle delete address state changes.
  void deleteAddressSwitch(BuildContext context, AddressState state) {
    switch (state.deleteAddressState) {
      case RequestState.loading:
        LoadingUtils.showLoadingDialog(
            context, LoadingType.linear, StringsManager.deleting);
        break;
      case RequestState.success:
        BlocProvider.of<AddressBloc>(context).add(GetAllAddressesEvent());
        Navigator.of(context).pop();
        SnackBarUtil().getSnackBar(
          context: context,
          color: ColorsManager.gGreen,
          message: StringsManager.deleteAddressMessage,
        );
      case RequestState.error:
        BlocProvider.of<AddressBloc>(context).add(GetAllAddressesEvent());
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) => ErrorDialog(
            errorMessage: state.deleteAddressMessage,
          ),
        );
      default:
    }
  }
}
