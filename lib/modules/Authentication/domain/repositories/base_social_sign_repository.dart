import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../authentication/domain/entities/user.dart';

abstract class BaseSocialSignRepository {
  Future<Either<Failure, UserEntity>> signWithFacebook();
  Future<Either<Failure, UserEntity>> signWithGoogle();
}
