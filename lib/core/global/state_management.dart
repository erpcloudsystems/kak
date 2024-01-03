import 'package:flutter_bloc/flutter_bloc.dart';

import '../global/dependencies_container.dart' as di;
import '../../modules/Cart/presentation/bloc/cart_bloc.dart';
import '../../modules/meals/presentation/bloc/meals_bloc.dart';
import '../../modules/Payment/presentation/bloc/payment_bloc.dart';
import '../../modules/Address/presentation/bloc/address/address_bloc.dart';
import '../../modules/user_profile/presentation/bloc/user_profile_bloc.dart';
import '../../modules/Address/presentation/bloc/location/location_bloc.dart';
import '../../modules/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';
import '../../modules/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';
import '../../modules/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';

class StateManagement {
  static dynamic providers = [
    BlocProvider(create: (_) => di.sl<CachingUserDataBloc>()),
    BlocProvider(create: (_) => di.sl<AuthenticationBloc>()),
    BlocProvider(create: (_) => di.sl<UserProfileBloc>()),
    BlocProvider(create: (_) => di.sl<SocialSignBloc>()),
    BlocProvider(create: (_) => di.sl<LocationBloc>()),
    BlocProvider(create: (_) => di.sl<PaymentBloc>()),
    BlocProvider(create: (_) => di.sl<AddressBloc>()),
    BlocProvider(create: (_) => di.sl<CartBloc>()),
    BlocProvider(
      create: (_) => di.sl<MealsBloc>()
        ..add(GetOffersEvent())
        ..add(GetFeaturedEvent())
        ..add(GetMealsGroupsEvent()),
    ),
  ];
}
