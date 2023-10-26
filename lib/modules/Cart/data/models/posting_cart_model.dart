
import '../../domain/entities/posting_cart.dart';

class PostingCartModel extends PostingCartEntity {
  const PostingCartModel({
    required super.productId,
    required super.userId,
    super.quantity,
  });

  factory PostingCartModel.fromJson(Map<String, dynamic> json) =>
      PostingCartModel(
        productId: json['product_id'],
        quantity: json['quantity'],
        userId: json['user_id'],
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        if (quantity != null) 'quantity': quantity,
        'user_id': userId,
      };
}
