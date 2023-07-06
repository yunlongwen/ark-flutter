import 'package:core/clients/remote_api_client/base/i_remote_api_client.dart';
import 'package:moment/post.dart';

abstract class PostRepository {
  Future<Post> getPost();

  Future<void> savePost(Post post);
}

class PostRepositoryImpl implements PostRepository {
  final IRemoteApiClient remoteApiClient;

  PostRepositoryImpl(this.remoteApiClient);

  @override
  Future<Post> getPost() async {
    final response = await remoteApiClient.get('/posts/1');
    final post = Post.fromMap(response);
    return post;
  }

  @override
  Future<void> savePost(Post post) async {}
}
