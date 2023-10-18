import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_helper.dart';
import '../network/network_info.dart';
import '../../modules/authentication/domain/usecases/sign_with_google.dart';
import '../../modules/authentication/data/repositories/social_sign_repository.dart';
import '../../modules/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';
import '../../modules/authentication/domain/repositories/base_social_sign_repository.dart';
import '../../modules/authentication/data/datasources/base_authentication_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLOCs ________________________________________________________________
  // Authentication
  // sl.registerFactory(() => AuthenticationBloc(sl(),sl(), sl(), sl()));
  sl.registerFactory(() => SocialSignBloc(sl()));

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

  // Repositories __________________________________________________________
  // Authentication
  sl.registerLazySingleton<BaseSocialSignRepository>(
      () => SocialSignRepository(sl(), sl()));
  // sl.registerLazySingleton<AuthBaseRepo>(() => AuthRepoImpl(sl(), sl()));

  // Caching
  // sl.registerLazySingleton<CacheUserDataBaseRepo>(() => CachingApiKeysRepoImpl(sl()));

  // Data sources __________________________________________________________
  // Authentication
  sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource());
  // sl.registerLazySingleton<AuthBaseRemoteDataSources>(() => AuthRemoteDataSourcesByDio(sl()));

  // Caching
  // sl.registerLazySingleton<CachingBaseDataSource>(() =>CachingDataSourceImplByShaPref());

  // External ______________________________________________________________
  final sharedPref = await SharedPreferences.getInstance();

  sl.registerLazySingleton<BaseDioHelper>(() => DioHelper());
  sl.registerLazySingleton(() => FirebaseAuth);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
  sl.registerLazySingleton<BaseNetworkInfo>(() => NetworkInfo(sl()));
}
