import 'package:dartz/dartz.dart';

import '../../../../core/global/type_def.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../authentication/data/models/user_model.dart';
import '../../../authentication/domain/entities/logged_in_user_entity.dart';
import '../../../authentication/domain/entities/user.dart';
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
        OfflineFailure(errorMessage: 'StringsManager.offlineFailureMessage'),
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

  //_________________________ Delete user account __________________________________
  @override
  Future<Either<Failure, Unit>> deleteAccount(String email) async =>
      await _signMethod(() => _dataSource.deleteUserAccount(email));

  //_______________________________ Logout _________________________________________
  @override
  Future<Either<Failure, Unit>> logout(String email) async =>
      await _signMethod(() => _dataSource.logout(email));

  //_________________________common returning Unit method___________________________
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
        OfflineFailure(errorMessage: 'StringsManager.offlineFailureMessage'),
      );
    }
  }
}