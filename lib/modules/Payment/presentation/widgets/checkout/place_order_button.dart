import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/payment_bloc.dart';
import '../../../domain/entities/order.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/resources/routes.dart';
import '../../../../../core/utils/error_dialog.dart';
import '../../../../../core/utils/general_button.dart';
import '../../../../Cart/presentation/bloc/cart_bloc.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/loading_indicator_util.dart';
import '../../../../../core/global/dependencies_container.dart';
import '../../../../Address/presentation/bloc/address/address_bloc.dart';
import '../../../../user_profile/presentation/bloc/user_profile_bloc.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({super.key, required this.paymentType});

  final ValueNotifier<PaymentType> paymentType;

  @override
  Widget build(BuildContext context) {
    // Creating a new bloc instance here so it won't conflict with the userProfileScreen bloc.
    return BlocProvider(
      create: (context) => sl<UserProfileBloc>(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: DoubleManager.d_8,
          right: DoubleManager.d_8,
          bottom: DoubleManager.d_15,
        ),
        child: BlocConsumer<UserProfileBloc, UserProfileState>(
          listenWhen: (previous, current) =>
              previous.getUserProfileState != current.getUserProfileState,
          listener: (context, state) {
            if (state.getUserProfileState == RequestState.success) {
              final mobile = state.getUserProfileData.mobileNo;
              if (mobile == StringsWithNoCtx.none.tr()) {
                ErrorDialogUtils.displayErrorDialog(
                    errorMessage: StringsManager.addMobileMessage(context),
                    context: context,
                    onPressed: () {
                      Navigator.pop(context); // To close the dialog.
                      Navigator.pushNamed(context, Routes.userProfileScreenKey);
                    });
              } else {
                context.read<PaymentBloc>().add(CreateOrderEvent(
                      order: OrderEntity(
                        customerAddress:
                            context.read<AddressBloc>().state.userAddressId,
                        modeOfPayment: paymentType.value,
                        items: context.read<CartBloc>().state.getCartItemsData,
                      ),
                    ));
              }
            }
          },
          buildWhen: (previous, current) =>
              previous.getUserProfileState != current.getUserProfileState,
          builder: (context, state) {
            if (state.getUserProfileState == RequestState.loading) {
              return const LoadingIndicatorUtil();
            }
            return ColoredElevatedButton(
              onPressed: () =>
                  context.read<UserProfileBloc>().add(GetUserProfileEvent()),
              buttonText: StringsManager.placeOrder(context),
            );
          },
        ),
      ),
    );
  }
}
