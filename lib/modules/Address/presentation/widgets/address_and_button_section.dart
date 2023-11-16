import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../bloc/address_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class AddressAndButtonSection extends StatelessWidget {
  const AddressAndButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: DoubleManager.d_30.h,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: BlocBuilder<AddressBloc, AddressState>(
            buildWhen: (previous, current) =>
                current.getAddressState != previous.getAddressState,
            builder: (context, state) {
              switch (state.getAddressState) {
                case RequestState.stable:
                  return const SizedBox.shrink();

                case RequestState.loading:
                  return const Center(child: CircularProgressIndicator());

                case RequestState.error:
                  return Center(child: Text(state.getAddressMessage));

                case RequestState.success:
                  return const SuccessWidget();
              }
            }));
  }
}

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Delivery location
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.symmetric(vertical: DoubleManager.d_20),
          child: Text(
            StringsManager.deliveryLocation,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),

        // Address
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.black,
            ),
            const SizedBox(width: DoubleManager.d_20),
            Flexible(
              child: Text(
                context.watch<AddressBloc>().state.getAddressMessage,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: FontsSize.s12,
                    ),
              ),
            ),
          ],
        ),

        // Delivery button
        InkWell(
          // TODO: Implement on tap logic.
          onTap: () {},
          child: Container(
            height: DoubleManager.d_70,
            width: double.infinity,
            margin: const EdgeInsets.all(DoubleManager.d_20),
            padding: const EdgeInsets.all(DoubleManager.d_10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorsManager.mainColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(DoubleManager.d_20)),
            child: Text(
              StringsManager.deliverHere,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontSize: FontsSize.s18,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
