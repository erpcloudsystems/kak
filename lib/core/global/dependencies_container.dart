import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_helper.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLOCs ________________________________________________________________
  // Authentication
  // sl.registerFactory(() => AuthenticationBloc(sl(),sl(), sl(), sl()));
 
  // Caching
  // sl.registerFactory(() => CachingBloc(sl(),sl(), sl()));

  // Use cases ____________________________________________________________
  // Authentication
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
  // sl.registerLazySingleton<AuthBaseRepo>(() => AuthRepoImpl(sl(), sl()));

  // Caching
  // sl.registerLazySingleton<CacheUserDataBaseRepo>(() => CachingApiKeysRepoImpl(sl()));
  

  // Data sources __________________________________________________________
  // Authentication
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