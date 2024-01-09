import 'package:dartz/dartz.dart';

import '../entities/taxes.dart';
import '../repositories/payment_base_repo.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';

class GetTaxesUseCase extends BaseUseCase<TaxesEntity, NoParameters> {
  final PaymentBaseRepo repo;
  GetTaxesUseCase(this.repo);

  @override
  Future<Either<Failure, TaxesEntity>> call(NoParameters parameters) async =>
      await repo.getTaxes();
}
