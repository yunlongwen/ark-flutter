import 'package:dio/dio.dart';

class UserAgentData {
  final String clientVersion;
  final String deviceModel;

  const UserAgentData({this.clientVersion = "0.0.0", this.deviceModel = ""});
}

class UserAgentInterceptor extends Interceptor {
  UserAgentData? userAgentData = const UserAgentData();

  UserAgentInterceptor({this.userAgentData});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.putIfAbsent(
      "Client-Version",
      () => userAgentData?.clientVersion,
    );
    options.headers.putIfAbsent(
      "Device-Model",
      () => userAgentData?.deviceModel,
    );
    super.onRequest(options, handler);
  }
}
