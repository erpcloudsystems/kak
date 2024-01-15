import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../generated/l10n.dart';
import '../network/dio_helper.dart';
import '../network/network_info.dart';
import '../../modules/Cart/presentation/bloc/cart_bloc.dart';
import '../../modules/Payment/domain/usecases/get_taxes.dart';
import '../../modules/meals/presentation/bloc/meals_bloc.dart';
import '../../modules/meals/data/datasources/meals_remote.dart';
import '../../modules/Payment/domain/usecases/create_order.dart';
import '../../modules/meals/domain/usecases/get_meals_groups.dart';
import '../../modules/meals/domain/usecases/get_meal_details.dart';
import '../../modules/Payment/presentation/bloc/payment_bloc.dart';
import '../../modules/Address/domain/usecases/delete_address.dart';
import '../../modules/meals/domain/usecases/get_offers_meals.dart';
import '../../modules/Payment/domain/usecases/get_orders_list.dart';
import '../../modules/meals/data/repositories/meals_repo_impl.dart';
import '../../modules/meals/domain/usecases/get_featured_meals.dart';
import '../../modules/Payment/domain/usecases/get_order_details.dart';
import '../../modules/meals/domain/repositories/meals_base_repo.dart';
import '../../modules/Address/domain/usecases/get_all_addresses.dart';
import '../../modules/Address/domain/usecases/send_user_address.dart';
import '../../modules/meals/domain/usecases/get_meal_group_items.dart';
import '../../modules/user_profile/data/datasources/user_profile.dart';
import '../../modules/Address/data/repositories/address_repo_impl.dart';
import '../../modules/Address/domain/usecases/set_primary_address.dart';
import '../../modules/Payment/data/repositories/payment_repo_impl.dart';
import '../../modules/Address/domain/usecases/get_address_use_case.dart';
import '../../modules/Address/data/datasources/address_data_source.dart';
import '../../modules/Payment/data/datasources/payment_data_source.dart';
import '../../modules/user_profile/domain/usecases/get_user_profile.dart';
import '../../modules/Address/domain/repositories/address_base_repo.dart';
import '../../modules/Payment/domain/repositories/payment_base_repo.dart';
import '../../modules/Address/presentation/bloc/address/address_bloc.dart';
import '../../modules/user_profile/domain/usecases/edit_user_profile.dart';
import '../../modules/authentication/domain/usecases/logout_use_case.dart';
import '../../modules/Payment/domain/usecases/pay_with_card_use_case.dart';
import '../../modules/user_profile/data/repositories/user_pofile_impl.dart';
import '../../modules/authentication/domain/usecases/sign_with_google.dart';
import '../../modules/authentication/domain/usecases/sign_in_use_case.dart';
import '../../modules/authentication/domain/usecases/sign_up_use_case.dart';
import '../../modules/Address/presentation/bloc/location/location_bloc.dart';
import '../../modules/user_profile/presentation/bloc/user_profile_bloc.dart';
import '../../modules/authentication/domain/usecases/cache_user_use_case.dart';
import '../../modules/user_profile/domain/repositories/user_profile_base.dart';
import '../../modules/authentication/domain/usecases/get_cached_language.dart';
import '../../modules/authentication/domain/usecases/cache_device_language.dart';
import '../../modules/Address/domain/usecases/get_current_location_use_case.dart';
import '../../modules/authentication/domain/usecases/delete_account_use_case.dart';
import '../../modules/authentication/domain/usecases/reset_password_use_case.dart';
import '../../modules/authentication/data/repositories/social_sign_repository.dart';
import '../../modules/authentication/domain/usecases/get_cached_user_use_case.dart';
import '../../modules/authentication/domain/usecases/sign_with_facebook_use_case.dart';
import '../../modules/authentication/data/repositories/caching_user_data_repository.dart';
import '../../modules/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';
import '../../modules/authentication/domain/repositories/base_social_sign_repository.dart';
import '../../modules/authentication/domain/usecases/delete_user_cached_data_use_case.dart';
import '../../modules/authentication/data/datasources/authentication_local_data_source.dart';
import '../../modules/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';
import '../../modules/authentication/data/repositories/regular_authentication_repository.dart';
import '../../modules/authentication/domain/repositories/base_caching_user_data_repository.dart';
import '../../modules/authentication/data/datasources/base_authentication_remote_data_source.dart';
import '../../modules/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';
import '../../modules/authentication/domain/repositories/base_regular_authentication_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLOCs ________________________________________________________________

  // Authentication
  sl.registerFactory(() => SocialSignBloc(sl(), sl()));
  sl.registerFactory(() => AuthenticationBloc(sl(), sl(), sl(), sl(), sl()));

  // Meals
  sl.registerFactory(() => MealsBloc(sl(), sl(), sl(), sl(), sl()));

  // Address
  sl.registerFactory(() => LocationBloc(sl(), sl()));
  sl.registerFactory(() => AddressBloc(sl(), sl(), sl(), sl()));

  // Payment
  sl.registerFactory(() => PaymentBloc(sl(), sl(), sl(), sl(), sl()));

  // Caching
  sl.registerFactory(() => CachingUserDataBloc(sl(), sl(), sl(), sl(), sl()));

  // Cart
  sl.registerFactory(() => CartBloc());

  // User profile
  sl.registerFactory(() => UserProfileBloc(sl(), sl()));

  // Use cases ____________________________________________________________

  // Authentication
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => DeleteAccountUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => SignWithGoogleUseCase(sl()));
  sl.registerLazySingleton(() => SignWithFacebookUseCase(sl()));

  // Caching
  sl.registerLazySingleton(() => CacheUserUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));
  sl.registerLazySingleton(() => CacheAppLanguageUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedLanguageUseCase(sl()));
  sl.registerLazySingleton(() => DeleteUserCachedDataUseCase(sl()));

  // Meals
  sl.registerLazySingleton(() => GetOffersMealsUseCase(sl()));
  sl.registerLazySingleton(() => GetMealsGroupsUseCase(sl()));
  sl.registerLazySingleton(() => GetMealDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetFeaturedMealsUseCase(sl()));
  sl.registerLazySingleton(() => GetMealGroupItemsUseCase(sl()));

  // Address
  sl.registerLazySingleton(() => GetAddressUseCase(sl()));
  sl.registerLazySingleton(() => DeleteAddressUseCase(sl()));
  sl.registerLazySingleton(() => SendUserAddressUseCase(sl()));
  sl.registerLazySingleton(() => GetAllAddressesUseCase(sl()));
  sl.registerLazySingleton(() => SetPrimaryAddressUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentLocationUseCase(sl()));

  // Payment
  sl.registerLazySingleton(() => GetTaxesUseCase(sl()));
  sl.registerLazySingleton(() => PayWithCardUseCase(sl()));
  sl.registerLazySingleton(() => CreateOrderUseCase(sl()));
  sl.registerLazySingleton(() => GetOrdersListUseCase(sl()));
  sl.registerLazySingleton(() => GetOrderDetailsUseCase(sl()));

  // User profile
  sl.registerLazySingleton(() => GetUserProfileUseCase(sl()));
  sl.registerLazySingleton(() => EditUserProfileUseCase(sl()));

  // Repositories __________________________________________________________

  // Authentication
  sl.registerLazySingleton<BaseSocialSignRepository>(
      () => SocialSignRepository(sl(), sl()));
  sl.registerLazySingleton<BaseRegularAuthenticationRepository>(
      () => AuthenticationRepository(sl(), sl()));

  // Caching
  sl.registerLazySingleton<BaseCachingUserDataRepository>(
      () => CachingUserDataRepository(sl()));

  // Meals
  sl.registerLazySingleton<MealsBaseRepo>(() => MealsRepoImpl(sl(), sl()));

  // Address
  sl.registerLazySingleton<AddressBaseRepo>(() => AddressRepoImpl(sl(), sl()));

  // Payment
  sl.registerLazySingleton<PaymentBaseRepo>(() => PaymentRepoImpl(sl(), sl()));

  // User profile
  sl.registerLazySingleton<UserProfileBaseRepo>(
      () => UserProfileRepoImpl(sl(), sl()));

  // Data sources __________________________________________________________

  // Authentication
  sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource(sl()));

  // Caching
  sl.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());

  // Meals
  sl.registerLazySingleton<MealsBaseRemoteDataSource>(
      () => MealsRemoteDataSourceByDio(sl()));

  // Address
  sl.registerLazySingleton<AddressBaseDataSource>(
      () => AddressDataSourceImpl(sl()));

  // Payment
  sl.registerLazySingleton<PaymentBaseDataSource>(
      () => PaymentDataSourceImplByDio(sl()));

  // User profile
  sl.registerLazySingleton<UserProfileBaseDataSource>(
      () => UserProfileDataSourceByDio(sl()));

  // External ______________________________________________________________
  final sharedPref = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => S());
  sl.registerLazySingleton(() => FirebaseAuth);
  sl.registerLazySingleton<BaseDioHelper>(() => DioHelper());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
  sl.registerLazySingleton<BaseNetworkInfo>(() => NetworkInfo(sl()));
}
