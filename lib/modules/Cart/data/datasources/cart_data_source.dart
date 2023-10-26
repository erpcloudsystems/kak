// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// import '../models/posting_cart_model.dart';
// import '../models/returning_cart_item.dart';
// import '../../domain/entities/posting_cart.dart';
// import '../../../../core/network/dio_helper.dart';
// import '../../../../core/network/api_constance.dart';
// import '../../domain/entities/returning_cart_item.dart';

// abstract class CartBaseDataSource {
//   Future<ReturningCartEntity> updateCartItem(PostingCartEntity item);
//   Future<ReturningCartEntity> deleteCartItem(PostingCartEntity item);
//   Future<ReturningCartEntity> getCartItems(int userId);
//   Future<Unit> addCartItem(PostingCartEntity item);
// }

// class CartDataSourceByDio implements CartBaseDataSource {
//   final BaseDioHelper dio;
//   CartDataSourceByDio(this.dio);

//   @override
//   Future<Unit> addCartItem(PostingCartEntity item) async {
//     final cartItem = PostingCartModel(
//       productId: item.productId,
//       quantity: item.quantity,
//       userId: item.userId,
//     );

//     await dio.post(
//       endPoint: ApiConstance.addItemToCart,
//       data: cartItem.toJson(),
//       isSign: true,
//     );

//     return Future.value(unit);
//   }

//   @override
//   Future<ReturningCartEntity> deleteCartItem(PostingCartEntity item) async {
//     final cartItem = PostingCartModel(
//       productId: item.productId,
//       userId: item.userId,
//     );

//     final response = await dio.post(
//       endPoint: ApiConstance.removeCartItem,
//       data: cartItem.toJson(),
//       isSign: true,
//     ) as Response;

//     final data = ReturningCartModel.fromJson(response.data);
//     return data;
//   }

//   @override
//   Future<ReturningCartEntity> getCartItems(int userId) async {
//     final response = await dio.post(
//       endPoint: ApiConstance.getCartItems,
//       data: {'user_id': userId},
//       isSign: true,
//     ) as Response;

//     final data = ReturningCartModel.fromJson(response.data);
//     return data;
//   }

//   @override
//   Future<ReturningCartEntity> updateCartItem(PostingCartEntity item) async {
//     final cartItem = PostingCartModel(
//       productId: item.productId,
//       userId: item.userId,
//       quantity: item.quantity,
//     );

//     final response = await dio.post(
//       endPoint: ApiConstance.updateCartItem,
//       data: cartItem.toJson(),
//       isSign: true,
//     ) as Response;

//     final data = ReturningCartModel.fromJson(response.data);

//     return data;
//   }
// }
