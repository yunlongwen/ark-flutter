import 'package:moment/di/network_module.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

class _NetworkModule extends NetworkModule {}

Future<void> configureInjection() async {
  final gh = GetItHelper(getIt);
  final networkModule = _NetworkModule();

  gh.singleton<DioClient>(networkModule.dioClient);
  gh.singleton<IRemoteApiClient<dynamic>>(networkModule.remoteApiClient);
  gh.lazySingleton<UserAgentInterceptor>(
      () => networkModule.userAgentInterceptor);

  networkModule.addInterceptors(
    getIt<DioClient>(),
    getIt<UserAgentInterceptor>(),
  );
}