import 'package:dartz/dartz.dart';

import '../../modules/authentication/domain/entities/user.dart';
import '../../modules/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';

typedef AuthenticationEventFunction = AuthenticationEvent Function(UserEntity);
typedef SocialFunction = Future<UserEntity> Function();
typedef FutureFunction = Future<Unit> Function();
