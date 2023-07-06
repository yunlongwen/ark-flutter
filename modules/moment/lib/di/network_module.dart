import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

 class NetworkModule {
  NetworkModule();

  DioClient get dioClient => DioClient(
      dioConfiguration: const DioConfiguration(
          baseUrl: "https://jsonplaceholder.typicode.com"));

  @singleton
  IRemoteApiClient<dynamic> get remoteApiClient =>
      RemoteApiClient(getIt<DioClient>().dio);

  @lazySingleton
  UserAgentInterceptor get userAgentInterceptor => UserAgentInterceptor();

  @singleton
  addInterceptors(
      DioClient dioClient, UserAgentInterceptor userAgentInterceptor) {
    dioClient.dio.interceptors.addAll([userAgentInterceptor]);

    return dioClient.dio.interceptors;
  }
}
