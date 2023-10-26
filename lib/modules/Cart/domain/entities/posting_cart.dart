import 'package:equatable/equatable.dart';

class PostingCartEntity extends Equatable {
  final int? userId, productId, quantity;

  const PostingCartEntity({
    required this.productId,
    required this.userId,
    this.quantity,
  });

  @override
  List<Object?> get props => [
        productId,
        quantity,
        userId,
      ];
}
