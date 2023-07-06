import 'package:dio/dio.dart';

abstract class IRemoteApiClient<T> {
  Future<T?> get(
    String endpoint, {
    Map<String, dynamic>? queries,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onReceiveProgress,
  });

  Future<T?> post(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queries,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}

mixin RemoteApiClientMixin<T> implements IRemoteApiClient<T> {
  Dio get dio;

  @override
  Future<T?> get(
    String endpoint, {
    Map<String, dynamic>? queries,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<T> response = await dio.get(endpoint,
          queryParameters: queries,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<T?> post(String endpoint,
      {Object? data,
      Map<String, dynamic>? queries,
      CancelToken? cancelToken,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response<T> response = await dio.get(endpoint,
          queryParameters: queries,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } catch (_) {
      rethrow;
    }
  }
}
