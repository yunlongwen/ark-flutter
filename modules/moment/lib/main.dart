import 'package:core/clients/remote_api_client/base/i_remote_api_client.dart';
import 'package:core/clients/remote_api_client/dio/dio_client.dart';
import 'package:core/di/get_it_instance.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:moment/repository/post_repository.dart';

import 'di/network_module.dart';

class MomentScreen extends StatefulWidget {
  const MomentScreen({super.key, required this.title});

  final String title;

  @override
  State<MomentScreen> createState() => _MomentScreenState();
}

class _MomentScreenState extends State<MomentScreen> {
  String title = '';

  @override
  void initState() {
    final gh = GetItHelper(getIt);
    super.initState();
    NetworkModule networkModule = NetworkModule();
    gh.singleton<DioClient>(networkModule.dioClient);
    gh.lazySingleton<IRemoteApiClient<dynamic>>(
        () => networkModule.remoteApiClient);

    gh.lazySingleton<PostRepository>(
        () => PostRepositoryImpl(networkModule.remoteApiClient));
  }

  void _testRequest() async {
    final postRepository = getIt.get<PostRepository>();
    postRepository.getPost().then((value) => setState(() {
          title = value.title;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _testRequest,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
