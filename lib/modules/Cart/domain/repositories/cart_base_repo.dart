import '../../../meals/domain/entities/meal_entity.dart';

abstract class CartBaseRepo {
  void deleteCartItem(MealEntity meal);
  void addCartItem(MealEntity meal);
  List<MealEntity> getCartItems();
}
