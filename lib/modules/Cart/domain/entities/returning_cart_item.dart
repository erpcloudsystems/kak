import 'package:equatable/equatable.dart';

class ReturningCartEntity extends Equatable {
  final List<CartItemEntity> items;
  final int total;

  const ReturningCartEntity({required this.items, required this.total});

  @override
  List<Object?> get props => [items, total];
}

class CartItemEntity extends Equatable {
  final int productId, quantity, allQuantityPrice,itemPrice;
  final String productName, productImage;

  const CartItemEntity({
    required this.allQuantityPrice,
    required this.productImage,
    required this.productName,
    required this.productId,
    required this.itemPrice,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        allQuantityPrice,
        productImage,
        productName,
        productId,
        itemPrice,
        quantity,
      ];
}
