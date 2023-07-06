import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../models/exceptions/invalid_data_exception.dart';
import '../../../../models/network/base_response.dart';

class RefreshTokenInterceptor extends Interceptor {
  static const String tag = "RefreshTokenInterceptor";

  final Dio dio;
  final String baseUrl;
  final Future<String?> accessToken;
  final Future<String?> refreshToken;
  final ValueSetter<String>? onNewAccessToken;
  final ValueSetter<String>? onNewRefreshToken;

  static String refreshTokenApi(String baseUrl) =>
      '${baseUrl}api/TokenAuth/RefreshToken';

  RefreshTokenInterceptor({
    required this.dio,
    required this.baseUrl,
    required this.accessToken,
    required this.refreshToken,
    required this.onNewAccessToken,
    required this.onNewRefreshToken,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    if ((await accessToken) == null || (await refreshToken) == null) {
      handler.next(err);
      return;
    }

    var options = err.response!.requestOptions;

    await dio
        .post(refreshTokenApi(baseUrl), data: {
          "accessToken": await accessToken,
          "refreshToken": await refreshToken
        })
        .then((res) => BaseResponse.fromMap(res.data))
        .then((response) => AuthResponse.fromMap(response.result))
        .then((response) async {
          if (onNewAccessToken != null) onNewAccessToken!(response.accessToken);
          if (onNewRefreshToken != null) {
            onNewRefreshToken!(response.refreshToken);
          }
          options.headers["Authorization"] = 'Bearer ${response.accessToken}';
          return true;
        })
        .catchError((error) {
          if (kDebugMode) {
            print("[$tag][refreshToken] token refresh failed, error: $error");
          }

          return false;
        })
        .then((e) {
          //repeat
          dio.fetch(options).then(
            (r) => handler.resolve(r),
            onError: (e) {
              handler.reject(e);
            },
          );
        });
    handler.next(err);
    return;
  }
}

class AuthResponse {
  String accessToken;
  String refreshToken;

  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    if (map["accessToken"] == null && map["refreshToken"] == null) {
      throw InvalidDataException("Invalid response received from server");
    }

    return AuthResponse(
      accessToken: map["accessToken"],
      refreshToken: map["refreshToken"],
    );
  }

  @override
  String toString() {
    return 'AuthResponse{accessToken: $accessToken, refreshToken: $refreshToken,}';
  }
}
