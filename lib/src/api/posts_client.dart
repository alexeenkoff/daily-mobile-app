import 'package:daily_mobile_app/src/api/model/post_response.dart';

abstract class PostsClient {
  Future<List<PostResponse>> getPosts();
}
