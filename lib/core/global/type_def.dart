import 'package:dartz/dartz.dart';

import '../../modules/authentication/domain/entities/user.dart';
import '../../modules/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';

typedef FutureFunction = Future<Unit> Function();
typedef SocialFunction = Future<UserEntity> Function();
typedef AuthenticationEventFunction = AuthenticationEvent Function(
    String, String);
