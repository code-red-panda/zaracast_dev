import 'package:dio/dio.dart';
import 'package:zaracast/src/core/errors/exceptions.dart';
import 'package:zaracast/src/core/utils/dio/dio_exceptions.dart';

// TODO(red): Add a retry mechanism
class DioNetwork {
  DioNetwork({required String baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );

  final Dio _dio;

  Future<Response<T>> get<T>(
    String path,
    Map<String, String> headers, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
    } on DioException catch (e, stackTrace) {
      final message = DioErrorHandler.handleDioError(e);

      throw ServerException.dioError(
        dioMessage: message,
        stackTrace: stackTrace,
        arguments: {'path': path, 'queryParameters': queryParameters},
      );
    } catch (e, stackTrace) {
      throw ServerException.unknownError(
        stackTrace: stackTrace,
        arguments: {
          'path': path,
          'queryParameters': queryParameters,
        },
      );
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e, stackTrace) {
      final message = DioErrorHandler.handleDioError(e);

      throw ServerException.dioError(
        dioMessage: message,
        stackTrace: stackTrace,
        arguments: {'path': path, 'queryParameters': queryParameters},
      );
    } catch (e, stackTrace) {
      throw ServerException.unknownError(
        stackTrace: stackTrace,
        arguments: {
          'path': path,
          'queryParameters': queryParameters,
        },
      );
    }
  }
}
