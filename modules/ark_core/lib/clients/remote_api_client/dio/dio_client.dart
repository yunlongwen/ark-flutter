import 'package:dio/dio.dart';

const _kDefaultReceiveTimeout = 10000;
const _kDefaultConnectionTimeout = 10000;
const _kBaseUrl = "";

class DioConfiguration {
  final int receiveTimeout;
  final int connectionTimeout;
  final String baseUrl;

  const DioConfiguration(
      {this.receiveTimeout = _kDefaultReceiveTimeout,
      this.connectionTimeout = _kDefaultConnectionTimeout,
      this.baseUrl = _kBaseUrl});
}

class DioClient {
  final DioConfiguration dioConfiguration;
  final Dio _dio;

  DioClient({this.dioConfiguration = const DioConfiguration()})
      : _dio = Dio()
          ..options.baseUrl = dioConfiguration.baseUrl
          ..options.connectTimeout =
              Duration(milliseconds: dioConfiguration.connectionTimeout)
          ..options.receiveTimeout =
              Duration(milliseconds: dioConfiguration.receiveTimeout);

  Dio get dio => _dio;

  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    return _dio..interceptors.addAll(interceptors);
  }
}
