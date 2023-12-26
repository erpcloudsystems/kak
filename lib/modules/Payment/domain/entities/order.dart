import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../meals/domain/entities/meal_entity.dart';

class OrderEntity extends Equatable {
  final String customerAddress;
  final PaymentType modeOfPayment;
  final List<MealEntity> items;

  const OrderEntity({
    required this.customerAddress,
    required this.modeOfPayment,
    required this.items,
  });

  @override
  List<Object?> get props => [
        customerAddress,
        modeOfPayment,
        items,
      ];
}