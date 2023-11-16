import 'package:equatable/equatable.dart';

import '../../../authentication/domain/entities/user.dart';

class CardPaymentEntity extends Equatable {
  final UserEntity user;
  final int price;

  const CardPaymentEntity({required this.user, required this.price});

  @override
  List<Object?> get props => [user, price];
}
