import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../authentication/domain/entities/user.dart';
import '../../../authentication/data/models/user_model.dart';
import '../../../../core/network/helper_network_methods.dart';
import '../datasources/base_authentication_remote_data_source.dart';
import '../../../authentication/domain/entities/logged_in_user_entity.dart';
import '../../domain/repositories/base_regular_authentication_repository.dart';

class AuthenticationRepository implements BaseRegularAuthenticationRepository {
  final BaseNetworkInfo _deviceStatus;
  final BaseAuthenticationRemoteDataSource _dataSource;
  const AuthenticationRepository(this._deviceStatus, this._dataSource);

  //_____________________________Sign in___________________________________
  @override
  Future<Either<Failure, LoggedInUserEntity>> signIn(UserEntity user) async {
    final userModel = UserModel.fromUserEntity(user);
    return await HelperNetworkMethods.commonApiResponseMethod<
            LoggedInUserEntity>(
        () async => await _dataSource.signIn(userModel), _deviceStatus);
  }

  //____________________________Sign up_____________________________________
  @override
  Future<Either<Failure, Unit>> signUp(UserEntity user) async {
    final userModel = UserModel.fromUserEntity(user);
    return await HelperNetworkMethods.commonApiResponseMethod<Unit>(
        () async => await _dataSource.signUp(userModel), _deviceStatus);
  }

  //____________________________Reset password_____________________________________
  @override
  Future<Either<Failure, Unit>> resetPassword(String email) async =>
      await HelperNetworkMethods.commonApiResponseMethod<Unit>(
          () async => await _dataSource.resetPassword(email), _deviceStatus);

  //_________________________ Delete user account __________________________________
  @override
  Future<Either<Failure, Unit>> deleteAccount(String email) async =>
      await HelperNetworkMethods.commonApiResponseMethod<Unit>(
          () async => await _dataSource.deleteUserAccount(email),
          _deviceStatus);

  //_______________________________ Logout _________________________________________
  @override
  Future<Either<Failure, Unit>> logout(String email) async =>
      await HelperNetworkMethods.commonApiResponseMethod<Unit>(
          () async => await _dataSource.logout(email), _deviceStatus);

  //___________________________ Social sign________________________________________
  @override
  Future<Either<Failure, LoggedInUserEntity>> socialSign(
          UserEntity user) async =>
      await HelperNetworkMethods.commonApiResponseMethod<LoggedInUserEntity>(
        () async {
          final userModel = UserModel.fromUserEntity(user);
          return await _dataSource.socialSign(userModel);
        },
        _deviceStatus,
      );
}
