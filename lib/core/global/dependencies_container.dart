import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_helper.dart';
import '../network/network_info.dart';
import '../../modules/Payment/presentation/bloc/payment_bloc.dart';
import '../../modules/Address/presentation/bloc/address_bloc.dart';
import '../../modules/Address/data/repositories/address_repo_impl.dart';
import '../../modules/Payment/data/repositories/payment_repo_impl.dart';
import '../../modules/Address/domain/usecases/get_address_use_case.dart';
import '../../modules/Address/data/datasources/address_data_source.dart';
import '../../modules/Payment/data/datasources/payment_data_source.dart';
import '../../modules/Address/domain/repositories/address_base_repo.dart';
import '../../modules/Payment/domain/repositories/payment_base_repo.dart';
import '../../modules/Payment/domain/usecases/pay_with_card_use_case.dart';
import '../../modules/authentication/domain/usecases/sign_with_google.dart';
import '../../modules/Address/domain/usecases/get_current_location_use_case.dart';
import '../../modules/authentication/data/repositories/social_sign_repository.dart';
import '../../modules/authentication/domain/repositories/base_social_sign_repository.dart';
import '../../modules/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';
import '../../modules/authentication/data/datasources/base_authentication_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLOCs ________________________________________________________________

  // Authentication
  // sl.registerFactory(() => AuthenticationBloc(sl(),sl(), sl(), sl()));
  sl.registerFactory(() => SocialSignBloc(sl()));

  // Address
  sl.registerFactory(() => AddressBloc(sl(), sl()));

  // Payment
  sl.registerFactory(() => PaymentBloc(sl()));

  // Caching
  // sl.registerFactory(() => CachingBloc(sl(),sl(), sl()));

  // Use cases ____________________________________________________________
  
  // Authentication
  sl.registerLazySingleton(() => SignWithGoogleUseCase(sl()));
  // sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  // sl.registerLazySingleton(() => SignUpUseCase(sl()));
  // sl.registerLazySingleton(() => LogoutUseCase(sl()));
  // sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Caching
  //  sl.registerLazySingleton(() => RemoveApiCachedKeysUseCase(sl()));
  //  sl.registerLazySingleton(() => GetCachedApiKeysUseCase(sl()));
  //  sl.registerLazySingleton(() => CacheApiKeysUseCase(sl()));

  // Address 
  sl.registerLazySingleton(() => GetCurrentLocationUseCase(sl()));
  sl.registerLazySingleton(() => GetAddressUseCase(sl()));

  // Payment
  sl.registerLazySingleton(() => PayWithCardUseCase(sl()));

  // Repositories __________________________________________________________

  // Authentication
  sl.registerLazySingleton<BaseSocialSignRepository>(
      () => SocialSignRepository(sl(), sl()));
  // sl.registerLazySingleton<AuthBaseRepo>(() => AuthRepoImpl(sl(), sl()));

  // Caching
  // sl.registerLazySingleton<CacheUserDataBaseRepo>(() => CachingApiKeysRepoImpl(sl()));

  // Address
  sl.registerLazySingleton<AddressBaseRepo>(() => AddressRepoImpl(sl(), sl()));

  // Payment
  sl.registerLazySingleton<PaymentBaseRepo>(() => PaymentRepoImpl(sl(), sl()));

  // Data sources __________________________________________________________

  // Authentication
  sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource());
  // sl.registerLazySingleton<AuthBaseRemoteDataSources>(() => AuthRemoteDataSourcesByDio(sl()));

  // Caching
  // sl.registerLazySingleton<CachingBaseDataSource>(() =>CachingDataSourceImplByShaPref());

  // Address
  sl.registerLazySingleton<AddressBaseDataSource>(() => AddressDataSourceImpl(sl()));

  // Payment
  sl.registerLazySingleton<PaymentBaseDataSource>(() => PayByPaymobGateway(sl()));

  // External ______________________________________________________________
  final sharedPref = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => FirebaseAuth);
  sl.registerLazySingleton<BaseDioHelper>(() => DioHelper());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
  sl.registerLazySingleton<BaseNetworkInfo>(() => NetworkInfo(sl()));
}
