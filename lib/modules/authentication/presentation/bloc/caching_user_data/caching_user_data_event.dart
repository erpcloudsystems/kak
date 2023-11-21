part of 'caching_user_data_bloc.dart';

abstract class CachingUserDataEvent extends Equatable {
  const CachingUserDataEvent();

  @override
  List<Object> get props => [];
}

class CacheUserDataEvent extends CachingUserDataEvent {
  final UserCachingDataEntity userData;
  const CacheUserDataEvent({required this.userData});
}

class GetCachedUserDataEvent extends CachingUserDataEvent {}

class DeleteCachedUserDataEvent extends CachingUserDataEvent {}
