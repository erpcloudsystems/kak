import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/global/constant_keys.dart';
import '../../../../core/global/dependencies_container.dart';
import '../../domain/entities/user_caching_data_entity.dart';

abstract class BaseLocalDataSource {
  Future<Unit> cachingAppLanguage(DeviceLanguage language);
  Future<Unit> cacheUser(UserCachingDataEntity userData);
  Future<UserCachingDataEntity> getCachedUser();
  Future<DeviceLanguage> getCachedAppLanguage();
  Future<Unit> deleteUserCachedData();
}

class LocalDataSource implements BaseLocalDataSource {
  @override
  Future<Unit> cacheUser(UserCachingDataEntity userData) async {
    await sl<SharedPreferences>()
        .setString(ConstantKeys.userEmailCachingKey, userData.email)
        .whenComplete(() async => await sl<SharedPreferences>()
            .setString(ConstantKeys.userPasswordCachingKey, userData.password));

    return Future.value(unit);
  }

  @override
  Future<UserCachingDataEntity> getCachedUser() async {
    final cachedEmail =
        sl<SharedPreferences>().getString(ConstantKeys.userEmailCachingKey);
    final cachedPassword =
        sl<SharedPreferences>().getString(ConstantKeys.userPasswordCachingKey);

    if (cachedEmail != null && cachedPassword != null) {
      final userData =
          UserCachingDataEntity(email: cachedEmail, password: cachedPassword);
      return userData;
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> deleteUserCachedData() async {
    await sl<SharedPreferences>()
        .remove(ConstantKeys.userEmailCachingKey)
        .whenComplete(() async => await sl<SharedPreferences>()
            .remove(ConstantKeys.userPasswordCachingKey));
    return Future.value(unit);
  }

  @override
  Future<Unit> cachingAppLanguage(DeviceLanguage language) async {
    await sl<SharedPreferences>()
        .setString(ConstantKeys.languageCachingKey, language.name);
    return Future.value(unit);
  }

  @override
  Future<DeviceLanguage> getCachedAppLanguage() async {
    final cachedLanguage =
        sl<SharedPreferences>().getString(ConstantKeys.languageCachingKey);
    if (cachedLanguage != null) {
      late DeviceLanguage devLang;
      cachedLanguage == DeviceLanguage.arabic.name
          ? devLang = DeviceLanguage.arabic
          : devLang = DeviceLanguage.english;
      return devLang;
    } else {
      throw EmptyCacheException();
    }
  }
}
