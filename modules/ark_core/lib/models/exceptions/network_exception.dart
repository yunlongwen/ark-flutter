import 'package:core/models/network/base_response.dart';
import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final ErrorResponse error;

  NetworkException(this.error);

  factory NetworkException.fromException(Exception exception) {
    if (exception is DioException) {
      return NetworkException(_handleDioError(exception));
    }

    return NetworkException(ErrorResponse(
        message: "Unknown network error happened",
        details: exception.toString()));
  }

  static ErrorResponse _handleDioError(DioException exception) {
    final defaultError = ErrorResponse(
        statusCode: 500,
        message: "Error received from server",
        details: "Error details not provided by server");

    switch (exception.type) {
      case DioExceptionType.cancel:
        return ErrorResponse(message: "Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ErrorResponse(
            statusCode: 408,
            message:
                "Unable to connect with server, please check your internet connectivity",
            details: "Timeout occurred");
      case DioExceptionType.unknown:
        return ErrorResponse(
            message:
                "Unable to connect with server, please check your internet connectivity",
            details: "Unknown network error");
      case DioExceptionType.receiveTimeout:
        return ErrorResponse(
            message: "Receive timeout in connection with API server",
            details: "Receive Timeout occurred");
      case DioExceptionType.sendTimeout:
        return ErrorResponse(
            message: "Send timeout in connection with API server",
            details: "Send Timeout occurred");
      default:
        return defaultError;
    }
  }

  @override
  String toString() => error.message;
}
