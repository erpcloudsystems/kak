import '../repositories/cart_base_repo.dart';

class DeleteCartItemUseCase {
  final CartBaseRepo repo;
  DeleteCartItemUseCase(this.repo);

  void call(meal) => repo.deleteCartItem(meal);
}
