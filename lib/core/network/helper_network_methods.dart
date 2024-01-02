import 'package:dartz/dartz.dart';

import 'failure.dart';
import 'exceptions.dart';
import 'network_info.dart';
import '../utils/extensions.dart';
import '../resources/strings_manager.dart';

abstract class HelperNetworkMethods {

  /// This is a helper method which take an Api call and network info instance
  /// and type of the return data, and call the function and if there is an
  /// error it will handle it.
  static Future<Either<Failure, T>> commonApiResponseMethod<T>(
      Future<T> Function() wantedMethod, BaseNetworkInfo networkInfo) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await wantedMethod();
        return Right(data);
      } on PrimaryServerException catch (error) {
        return Left(
          ServerFailure(errorMessage: error.message),
        );
      }
    } else {
      return Left(OfflineFailure(errorMessage: StringsWithNoCtx.offlineFailureMessage.tr()));
    }
  }
}
