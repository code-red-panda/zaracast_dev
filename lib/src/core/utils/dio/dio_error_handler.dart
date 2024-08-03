import 'package:dio/dio.dart';

class DioErrorHandler {
  static String handleDioError(DioException dioError) {
    var dioMessage = '';

    switch (dioError.type) {
      case DioExceptionType.badCertificate:
        dioMessage = 'Bad certificate.';
      case DioExceptionType.badResponse:
        dioMessage = _handleHttpResponse(dioError.response);
      case DioExceptionType.cancel:
        dioMessage = 'Request to the server was cancelled.';
      case DioExceptionType.connectionError:
        dioMessage = 'Connection error wtih the server.';
      case DioExceptionType.connectionTimeout:
        dioMessage = 'Connection timeout with the server.';
      case DioExceptionType.receiveTimeout:
        dioMessage = 'Receive timeout in connection with the server.';
      case DioExceptionType.sendTimeout:
        dioMessage = 'Send timeout in connection with the server.';
      case DioExceptionType.unknown:
        dioMessage = dioError.error.toString();
    }

    return dioMessage;
  }

  static String _handleHttpResponse(Response<dynamic>? response) {
    switch (response?.statusCode) {
      case 400:
        return '400 - Bad request. Please try again later.';
      case 401:
        return '401 - Unauthorized request. Please log in again.';
      case 403:
        return '403 - Forbidden request. You do not have access.';
      case 404:
        return '404 - Resource not found. Please try again later.';
      case 500:
      default:
        return '500 - Internal server error. Please try again later.';
    }
  }
}
