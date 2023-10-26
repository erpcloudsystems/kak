import '../../domain/entities/returning_cart_item.dart';

class ReturningCartModel extends ReturningCartEntity {
  const ReturningCartModel({
    required super.total,
    required super.items,
  });

  factory ReturningCartModel.fromJson(Map<String, dynamic> json) =>
      ReturningCartModel(
        items: List.from((json['items']).map((e) => CartItemModel.fromJson(e))),
        total: json['cart_total'],
      );
}

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.quantity,
    required super.productId,
    required super.itemPrice,
    required super.productName,
    required super.productImage,
    required super.allQuantityPrice,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        allQuantityPrice: json['line_total'],
        itemPrice: json['line_subtotal'],
        productId: json['product_id'],
        productImage: json['image'],
        quantity: json['quantity'],
        productName: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'line_total': allQuantityPrice,
        'line_subtotal': itemPrice,
        'product_id': productId,
        'image': productImage,
        'quantity': quantity,
        'name': productName,
      };

  Map<String, dynamic> toOrderJson() => {
        'product_id': productId,
        'quantity': quantity,
      };
}
