import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String errorMessage;
  final bool unexpectedError;
  final int? statusCode;

  const ServerException({
    required this.errorMessage,
    this.unexpectedError = false,
    this.statusCode,
  });

  factory ServerException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerException(
          errorMessage: 'Connection timeout. Please try again.',
          statusCode: 408,
        );
      case DioExceptionType.sendTimeout:
        return const ServerException(
          errorMessage: 'Send timeout. Please try again.',
          statusCode: 408,
        );
      case DioExceptionType.receiveTimeout:
        return const ServerException(
          errorMessage: 'Receive timeout. Please try again.',
          statusCode: 408,
        );
      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode ?? 0;
        final message = _getErrorMessageFromStatusCode(statusCode);
        return ServerException(
          errorMessage: message,
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return const ServerException(
          errorMessage: 'Request was cancelled.',
        );
      case DioExceptionType.connectionError:
        return const ServerException(
          errorMessage: 'No internet connection. Please check your network.',
        );
      case DioExceptionType.badCertificate:
        return const ServerException(
          errorMessage: 'Bad certificate. Please try again.',
        );
      case DioExceptionType.unknown:
      return ServerException(
          errorMessage: dioError.message ?? 'Unknown error occurred.',
          unexpectedError: true,
        );
    }
  }

  static String _getErrorMessageFromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Forbidden. You don\'t have permission to access this resource.';
      case 404:
        return 'Resource not found.';
      case 429:
        return 'Too many requests. Please try again later.';
      case 500:
        return 'Internal server error. Please try again later.';
      case 502:
        return 'Bad gateway. Please try again later.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Server error occurred. Please try again.';
    }
  }
}

class CacheException implements Exception {
  final String message;

  const CacheException({this.message = 'Cache error occurred'});
}