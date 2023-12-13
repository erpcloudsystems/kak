import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../authentication/domain/entities/user.dart';
import '../../../authentication/domain/entities/logged_in_user_entity.dart';

abstract class BaseRegularAuthenticationRepository {
  Future<Either<Failure, LoggedInUserEntity>> signIn(UserEntity user);
  Future<Either<Failure, Unit>> deleteAccount(String email);
  Future<Either<Failure, Unit>> resetPassword(String email);
  Future<Either<Failure, Unit>> signUp(UserEntity user);
  Future<Either<Failure, Unit>> logout(String email);
}



