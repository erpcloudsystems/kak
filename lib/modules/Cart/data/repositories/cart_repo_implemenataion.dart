// import 'package:dartz/dartz.dart';

// import '../datasources/cart_data_source.dart';
// import '../../../../core/network/failure.dart';
// import '../../../../core/global/type_def.dart';
// import '../../domain/entities/posting_cart.dart';
// import '../../../../core/network/exceptions.dart';
// import '../../../../core/network/network_info.dart';
// import '../../domain/repositories/cart_base_repo.dart';
// import '../../domain/entities/returning_cart_item.dart';
// import '../../../../core/resources/strings_manager.dart';

// typedef ReturningCartFunction = Future<ReturningCartEntity> Function();

// class CartRepoImplementation implements CartBaseRepo {
//   final CartBaseDataSource dataSource;
//   final BaseNetworkInfo networkInfo;

//   const CartRepoImplementation(this.dataSource, this.networkInfo);

//   @override
//   Future<Either<Failure, Unit>> addCartItem(PostingCartEntity item) async {
//     return await unitMethod(() => dataSource.addCartItem(item));
//   }

//   @override
//   Future<Either<Failure, ReturningCartEntity>> deleteCartItem(PostingCartEntity item) async {
//     return await returningCartMethod(() => dataSource.deleteCartItem(item));
//   }

//   @override
//   Future<Either<Failure, ReturningCartEntity>> getCartItems(int userId) async {
//     return await returningCartMethod(() => dataSource.getCartItems(userId));
//   }

//   @override
//   Future<Either<Failure, ReturningCartEntity>> updateCartItem(
//       PostingCartEntity item) async {
//     return await returningCartMethod(() => dataSource.updateCartItem(item));
//   }

//   //_________________ common returning unit method ________________________________
//   Future<Either<Failure, Unit>> unitMethod(FutureFunction wantedMethod) async {
//     if (await networkInfo.isConnected) {
//       try {
//         await wantedMethod();
//         return const Right(unit);
//       } on PrimaryServerException catch (error) {
//         return Left(ServerFailure(errorMessage: error.message));
//       }
//     } else {
//       return const Left(
//           OfflineFailure(errorMessage: StringsManager.offlineFailureMessage));
//     }
//   }

//   //_________________ common returning cart method ________________________________
//   Future<Either<Failure, ReturningCartEntity>> returningCartMethod(
//       ReturningCartFunction wantedMethod) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final cartEntity = await wantedMethod();
//         return Right(cartEntity);
//       } on PrimaryServerException catch (error) {
//         return Left(ServerFailure(errorMessage: error.message));
//       }
//     } else {
//       return const Left(
//           OfflineFailure(errorMessage: StringsManager.offlineFailureMessage));
//     }
//   }
// }
