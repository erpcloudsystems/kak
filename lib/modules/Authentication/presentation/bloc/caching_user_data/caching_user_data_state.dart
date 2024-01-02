part of 'caching_user_data_bloc.dart';

class CachingUserDataState extends Equatable {
  // Cache user data
  final RequestState cacheUserDataState;
  final String cacheUserDataMessage;

  // get cached user data
  final RequestState getCacheUserDataState;
  final String getCacheUserDataMessage;
  final UserCachingDataEntity userCachedData;

  // delete cached user data
  final RequestState deleteCacheUserDataState;
  final String deleteCacheUserDataMessage;

  // Language
  final RequestState getCachedLanguageState;
  final RequestState cacheLanguageState;
  final DeviceLanguage language;

  const CachingUserDataState({
    this.cacheUserDataState = RequestState.loading,
    this.cacheUserDataMessage = '',
    this.getCacheUserDataState = RequestState.loading,
    this.getCacheUserDataMessage = '',
    this.userCachedData = const UserCachingDataEntity(email: '', password: ''),
    this.deleteCacheUserDataState = RequestState.stable,
    this.deleteCacheUserDataMessage = '',
    this.language = DeviceLanguage.english,
    this.getCachedLanguageState = RequestState.stable,
    this.cacheLanguageState = RequestState.stable,
  });

  CachingUserDataState copyWith({
    // Cache user state
    RequestState? cacheUserDataState,
    String? cacheUserDataMessage,

    // get cached user state
    RequestState? getCacheUserDataState,
    String? getCacheUserDataMessage,
    UserCachingDataEntity? userCachedData,

    // delete cached user state
    RequestState? deleteCacheUserDataState,
    String? deleteCacheUserDataMessage,

    // Language
    RequestState? getCachedLanguageState,
    RequestState? cacheLanguageState,
    DeviceLanguage? language,
  }) {
    return CachingUserDataState(
      cacheUserDataState: cacheUserDataState ?? this.cacheUserDataState,
      cacheUserDataMessage: cacheUserDataMessage ?? this.cacheUserDataMessage,
      getCacheUserDataState:
          getCacheUserDataState ?? this.getCacheUserDataState,
      getCacheUserDataMessage:
          getCacheUserDataMessage ?? this.getCacheUserDataMessage,
      userCachedData: userCachedData ?? this.userCachedData,
      deleteCacheUserDataState:
          deleteCacheUserDataState ?? this.deleteCacheUserDataState,
      deleteCacheUserDataMessage:
          deleteCacheUserDataMessage ?? this.deleteCacheUserDataMessage,
      getCachedLanguageState:
          getCachedLanguageState ?? this.getCachedLanguageState,
      cacheLanguageState: cacheLanguageState ?? this.cacheLanguageState,
      language: language ?? this.language,
    );
  }

  @override
  List<Object> get props => [
        cacheUserDataState,
        cacheUserDataMessage,
        getCacheUserDataState,
        getCacheUserDataMessage,
        userCachedData,
        deleteCacheUserDataState,
        deleteCacheUserDataMessage,
        language,
        getCachedLanguageState,
        cacheLanguageState,
      ];
}
