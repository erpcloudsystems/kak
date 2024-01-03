import 'package:dartz/dartz.dart';

import '../entities/user_profile.dart';
import '../../../../core/network/failure.dart';

abstract class UserProfileBaseRepo {
Future<Either<Failure, UserProfileEntity>> getUserProfile();
}