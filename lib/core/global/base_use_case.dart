import 'package:equatable/equatable.dart';

import '../network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}
