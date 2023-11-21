import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../../../../core/network/failure.dart';
import '../entities/logged_in_user_entity.dart';

abstract class BaseRegularAuthenticationRepository {
  Future<Either<Failure, LoggedInUserEntity>> signIn(UserEntity user);
  Future<Either<Failure, Unit>> resetPassword(String email);
  Future<Either<Failure, Unit>> signUp(UserEntity user);
}



