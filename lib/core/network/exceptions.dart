class OfflineException implements Exception {}

class EmptyCacheException implements Exception {}

class FacebookException implements Exception {
  final String message;
  const FacebookException({required this.message});
}

class PrimaryServerException implements Exception {
  final String error;
  final String message;
  final int code;

  PrimaryServerException({
    required this.error,
    required this.code,
    required this.message,
  });
}
