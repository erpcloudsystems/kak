import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mumo/core/resources/routes.dart';
import 'package:mumo/core/utils/enums.dart';
import 'package:mumo/modules/Payment/domain/entities/card_payment_entity.dart';
import 'package:mumo/modules/Payment/presentation/bloc/payment_bloc.dart';
import 'package:mumo/modules/authentication/domain/entities/user.dart';

import '../../../../core/utils/general_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocConsumer<PaymentBloc, PaymentState>(
              listener: (context, state) {
                if (state.payWithCardState == RequestState.success) {
                  Navigator.of(context).pushNamed(Routes.transactionScreenKey);
                }
              },
              builder: (context, state) {
                switch (state.payWithCardState) {
                  case RequestState.loading:
                    return const CircularProgressIndicator();

                  case RequestState.stable:
                    return const Text('Payment Screen');

                  case RequestState.error:
                    return Text(state.payWithCardMessage);

                  case RequestState.success:
                    return const Text('Success transaction');
                }
              },
            ),
          ),
          const SizedBox(height: 50),
          GeneralButton(
            buttonText: 'Pay with Card',
            function: () => BlocProvider.of<PaymentBloc>(context)
                .add(const PayWithCardEvent(
                    paymentData: CardPaymentEntity(
              user: UserEntity(
                phoneNumber: '01101265646',
                firstName: 'Mohamed',
                lastName: 'Mohamedy',
                password: 'password',
                email: 'email@test.com',
              ),
              price: 100,
            ))),
          ),
        ],
      ),
    );
  }
}
