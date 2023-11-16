import 'package:flutter_bloc/flutter_bloc.dart';

import '../global/dependencies_container.dart' as di;
import '../../modules/Payment/presentation/bloc/payment_bloc.dart';
import '../../modules/Address/presentation/bloc/address_bloc.dart';
import '../../modules/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';

class StateManagement {
  static dynamic providers = [
        BlocProvider(create: (_) => di.sl<SocialSignBloc>()),
        BlocProvider(create: (_) => di.sl<PaymentBloc>()),
        BlocProvider(create: (_) => di.sl<AddressBloc>()),
      // BlocProvider(create: (_) => di.sl<AuthenticationBloc>()),
      // BlocProvider(create: (_) => di.sl<CachingBloc>()),
  ];}