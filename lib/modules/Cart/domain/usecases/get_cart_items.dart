import '../../../meals/domain/entities/meal_entity.dart';
import '../repositories/cart_base_repo.dart';

class GetCartItemsUseCase {
  final CartBaseRepo repo;
  GetCartItemsUseCase(this.repo);

  List<MealEntity> call() => repo.getCartItems();
}
