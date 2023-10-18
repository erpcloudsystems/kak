import 'package:flutter_bloc/flutter_bloc.dart';

import '../global/dependencies_container.dart' as di;
import '../../modules/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';

class StateManagement {
  static dynamic providers = [
        BlocProvider(create: (_) => di.sl<SocialSignBloc>()),
      // BlocProvider(create: (_) => di.sl<AuthenticationBloc>()),
      // BlocProvider(create: (_) => di.sl<CachingBloc>()),
  ];}