import 'package:dartz/dartz.dart';

import '../models/user_model.dart';
import '../../domain/entities/user.dart';
import '../../../../core/global/type_def.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../domain/entities/logged_in_user_entity.dart';
import '../datasources/base_authentication_remote_data_source.dart';
import '../../domain/repositories/base_regular_authentication_repository.dart';

class AuthenticationRepository implements BaseRegularAuthenticationRepository {
  final BaseNetworkInfo _deviceStatus;
  final BaseAuthenticationRemoteDataSource _dataSource;
  const AuthenticationRepository(this._deviceStatus, this._dataSource);

  //_____________________________Sign in___________________________________
  @override
  Future<Either<Failure, LoggedInUserEntity>> signIn(UserEntity user) async {
    UserModel userModel = UserModel(email: user.email, password: user.password);
    if (await _deviceStatus.isConnected) {
      try {
        final returnedUser = await _dataSource.signIn(userModel);
        return Right(returnedUser);
      } on PrimaryServerException catch (error) {
        return Left(
          ServerFailure(errorMessage: error.message),
        );
      }
    } else {
      return const Left(
        OfflineFailure(errorMessage: StringsManager.offlineFailureMessage),
      );
    }
  }

  //____________________________Sign up_____________________________________
  @override
  Future<Either<Failure, Unit>> signUp(UserEntity user) async {
    UserModel userModel = UserModel(
      email: user.email,
      password: user.password,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      image: user.image,
    );
    return await _signMethod(() => _dataSource.signUp(userModel));
  }

  //____________________________Reset password_____________________________________
  @override
  Future<Either<Failure, Unit>> resetPassword(String email) async =>
      await _signMethod(() => _dataSource.resetPassword(email));

  //_____________________common returning Unit method___________________________
  Future<Either<Failure, Unit>> _signMethod(FutureFunction wantedMethod) async {
    if (await _deviceStatus.isConnected) {
      try {
        await wantedMethod();
        return const Right(unit);
      } on PrimaryServerException catch (error) {
        return Left(
          ServerFailure(errorMessage: error.message),
        );
      }
    } else {
      return const Left(
        OfflineFailure(errorMessage: StringsManager.offlineFailureMessage),
      );
    }
  }
}
