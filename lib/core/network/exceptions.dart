class ServerException implements Exception {}

class OfflineException implements Exception {}

class EmptyCacheException implements Exception {}

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

class PaymentException extends PrimaryServerException {
  PaymentException({
    required super.error,
    required super.code,
    required super.message,
  });
}
