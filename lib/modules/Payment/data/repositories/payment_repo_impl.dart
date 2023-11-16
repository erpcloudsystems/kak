import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../datasources/payment_data_source.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/card_payment_entity.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../domain/repositories/payment_base_repo.dart';

class PaymentRepoImpl implements PaymentBaseRepo {
  final PaymentBaseDataSource dataSource;
  final BaseNetworkInfo networkInfo;

  const PaymentRepoImpl(this.dataSource, this.networkInfo);

  @override
  Future<Either<Failure, String>> payWithCard(
      CardPaymentEntity paymentData) async {
    if (await networkInfo.isConnected) {
      try {
        final String response = await dataSource.payWithCard(paymentData);
        return Right(response);
      } on PrimaryServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(
          OfflineFailure(errorMessage: StringsManager.offlineFailureMessage));
    }
  }
}
