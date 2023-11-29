import '../repositories/cart_base_repo.dart';

class AddCartItemUseCase {
  final CartBaseRepo repo;
  AddCartItemUseCase(this.repo);

  void call(meal) async => repo.addCartItem(meal);
}
